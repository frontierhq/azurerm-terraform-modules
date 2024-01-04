.. image:: https://github.com/gofrontier-com/azurerm-terraform-modules/actions/workflows/ci.yml/badge.svg
    :target: https://github.com/gofrontier-com/azurerm-terraform-modules/actions/workflows/ci.yml

=========================
azurerm-terraform-modules
=========================

.. contents:: Table of Contents
    :local:

-----
About
-----

This repository contains a collection of Terraform modules based on the
`AzureRM provider <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs>`_.
They're intended to be used as part of a
`module composition <https://developer.hashicorp.com/terraform/language/modules/develop/composition>`_
approach to Terraform use. The modules implement a standardised approach to naming and tagging,
are written to be `secure by default <https://www.ncsc.gov.uk/information/secure-default>`_
and include `Azure Monitor Diagnostic Setting <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting>`_
resources where appropriate.

-----
Usage
-----

This repository maintains independent `semver <https://semver.org/>`_ versioning for each module,
and produces module-specific `releases <https://github.com/gofrontier-com/azurerm-terraform-modules/releases>`_.
This approach enables modules to be consumed independently of one another, and without the need for
Terraform to clone the entire repository.

To use a module, add a `module block <https://www.terraform.io/docs/language/modules/syntax.html>`_
and specify the source as a `module archive <https://developer.hashicorp.com/terraform/language/modules/sources#fetching-archives-over-http>`_
URL. The URL should be in the format:

``https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/[module name]-[version]/module.tar.gz//src``

For example:

.. code:: hcl

        module "resource_group" {
            source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/resource-group-1.0.0/module.tar.gz//src"

            environment = "dev"
            identifier  = "akscluster"
            location    = "uksouth"
            zone        = "shd"

            tags = {
                WorkloadType = "Shared/bootstrap"
            }
        }

See `Modules Overview <https://developer.hashicorp.com/terraform/language/modules>`_ for more information on Terraform Modules.

-------
Modules
-------

.. list-table::
   :widths: 25 25 50 25
   :header-rows: 1

   * - Module name
     - Latest version
     - Source URL
     - Links
   * - `key-vault <https://github.com/gofrontier-com/azurerm-terraform-modules/tree/main/modules/key-vault>`__
     - 1.0.11
     - ``https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/key-vault/1.0.11/module.tar.gz//src``
     - `Code <https://github.com/gofrontier-com/azurerm-terraform-modules/tree/main/modules/key-vault>`__ `Release <https://github.com/gofrontier-com/azurerm-terraform-modules/releases/tag/key-vault%2F1.0.11>`__
   * - `resource-group <https://github.com/gofrontier-com/azurerm-terraform-modules/tree/main/modules/resource-group>`__
     - 1.0.4
     - ``https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/resource-group/1.0.4/module.tar.gz//src``
     - `Code <https://github.com/gofrontier-com/azurerm-terraform-modules/tree/main/modules/resource-group>`__ `Release <https://github.com/gofrontier-com/azurerm-terraform-modules/releases/tag/resource-group%2F1.0.4>`__
   * - `storage-account <https://github.com/gofrontier-com/azurerm-terraform-modules/tree/main/modules/storage-account>`__
     - 1.0.0
     - ``https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/storage-account/1.0.0/module.tar.gz//src``
     - `Code <https://github.com/gofrontier-com/azurerm-terraform-modules/tree/main/modules/storage-account>`__ `Release <https://github.com/gofrontier-com/azurerm-terraform-modules/releases/tag/storage-account%2F1.0.0>`__

------------
Contributing
------------

We welcome contributions to this repository. Please see `CONTRIBUTING.md <https://github.com/gofrontier-com/azurerm-terraform-modules/tree/main/CONTRIBUTING.md>`_ for more information.
