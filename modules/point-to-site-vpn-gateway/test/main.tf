provider "azurerm" {
  features {}
}

module "point_to_site_vpn_gateway" {
  source = "../src"

  environment                              = "foo"
  identifier                               = "bar"
  location                                 = "uksouth"
  log_analytics_workspace_id               = "baz"
  resource_group_name                      = "qux"
  virtual_hub_id                           = ""
  vpn_client_address_pool_address_prefixes = []
  vpn_server_configuration_id              = ""
  zone                                     = "corge"

  tags = {
    Foo = "Bar"
  }
}
