provider "azurerm" {
  features {}
}

module "azurerm_vpn_server_configuration" {
  source = "../src"

  environment         = "baz"
  identifier          = "qux"
  location            = "uksouth"
  resource_group_name = "grault"
  zone                = "waldo"

  vpn_authentication_types = ["foo"]
  vpn_protocols            = ["bar"]

  tags = {
    Foo = "Bar"
  }
}
