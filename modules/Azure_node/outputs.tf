#Output value of public IP from created instance
output "PublicIpAzur" {
  value = azurerm_linux_virtual_machine.node.public_ip_address
}