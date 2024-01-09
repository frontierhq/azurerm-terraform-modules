provider "azurerm" {
  features {}
}

module "point_to_site_vpn_gateway" {
  source = "../src"

  environment         = "foo"
  identifier          = "bar"
  location            = "uksouth"
  resource_group_name = "qux"
  zone                = "corge"

  virtual_hub_id                           = "corge"
  vpn_client_address_pool_address_prefixes = []
  vpn_server_configuration_id              = "grault"

  tags = {
    Foo = "Bar"
  }
}
