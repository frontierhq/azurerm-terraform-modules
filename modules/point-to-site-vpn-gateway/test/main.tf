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

  log_analytics_workspace_id               = "grault"
  virtual_hub_id                           = "garply"
  vpn_client_address_pool_address_prefixes = []
  vpn_server_configuration_id              = "waldo"

  tags = {
    Foo = "Bar"
  }
}
