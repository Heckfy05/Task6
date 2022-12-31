#Specifying Providers and credentials
provider "aws" {
  region     = "eu-central-1"
  access_key = ""
  secret_key = ""
}

provider "azurerm" {
  features {}
  subscription_id = ""
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
}
