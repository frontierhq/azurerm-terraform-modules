provider "azurerm" {
  features {}
}

module "private_endpoint" {
  source = "../src"

  environment         = "baz"
  identifier          = "qux"
  location            = "uksouth"
  resource_group_name = "grault"
  zone                = "waldo"

  private_connection_resource_id = "id123"
  private_dns_zone_id            = "id456"
  subnet_id                      = "id789"

  tags = {
    Foo = "Bar"
  }
}
