provider "azurerm" {
  features {}
}

module "virtual_network_gateway" {
  source = "../src"

  environment         = "baz"
  identifier          = "qux"
  location            = "uksouth"
  resource_group_name = "grault"
  zone                = "waldo"

  log_analytics_workspace_id = "foo"
  public_ip_address_id       = "bar"
  subnet_id                  = "baz"

  tags = {
    Foo = "Bar"
  }
}
