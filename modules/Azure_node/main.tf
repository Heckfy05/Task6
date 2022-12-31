### Creating infrastructure for the Grafana instance

#Creating resource group
resource "azurerm_resource_group" "resurce_group" {
  name     = "resources"
  location = "West Europe"
}

#Creating virtual network
resource "azurerm_virtual_network" "Virtual_Network" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.resurce_group.location
  resource_group_name = azurerm_resource_group.resurce_group.name
}

#Creating subnet
resource "azurerm_subnet" "Subnet" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.resurce_group.name
  virtual_network_name = azurerm_virtual_network.Virtual_Network.name
  address_prefixes     = ["10.0.2.0/24"]
}

#Creating network Interface and specifying IP addresses
resource "azurerm_network_interface" "NI" {
  name                = "example-nic"
  location            = azurerm_resource_group.resurce_group.location
  resource_group_name = azurerm_resource_group.resurce_group.name


  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.Subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.PublicIP.id
  }
}

#Creating public IP
resource "azurerm_public_ip" "PublicIP" {
  name                = "public"
  location            = azurerm_resource_group.resurce_group.location
  resource_group_name = azurerm_resource_group.resurce_group.name
  allocation_method   = "Static"
}

#Creating network security group
resource "azurerm_network_security_group" "ports" {
  name                = "ports"
  location            = azurerm_resource_group.resurce_group.location
  resource_group_name = azurerm_resource_group.resurce_group.name
}

#Assosiating network interface with security group
resource "azurerm_network_interface_security_group_association" "asociation_secgroup" {
  network_interface_id      = azurerm_network_interface.NI.id
  network_security_group_id = azurerm_network_security_group.ports.id
}

#Creating network security rule for allowing inbound port 80
resource "azurerm_network_security_rule" "Rule80" {
  name                        = "80"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.resurce_group.name
  network_security_group_name = azurerm_network_security_group.ports.name
}

#Creating an instance for Grafana
resource "azurerm_linux_virtual_machine" "node" {
  name                = "node"
  resource_group_name = azurerm_resource_group.resurce_group.name
  location            = azurerm_resource_group.resurce_group.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  user_data           = filebase64(var.Grafana) #Specifying bash script for installing Grafana through variable
  network_interface_ids = [
    azurerm_network_interface.NI.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file(var.public_key_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}