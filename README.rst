.. image:: https://github.com/frontierhq/azurerm-terraform-modules/actions/workflows/ci.yml/badge.svg
    :target: https://github.com/frontierhq/azurerm-terraform-modules/actions/workflows/ci.yml

=========================
azurerm-terraform-modules
=========================

.. contents:: Table of Contents
    :local:

-----
About
-----

This repository contains a collection of Terraform modules based on the
`Azure Provider <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs>`_.
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
and produces module-specific `releases <https://github.com/frontierhq/azurerm-terraform-modules/releases>`_.
This approach enables modules to be consumed independently of one another, and without the need for
Terraform to clone the entire repository.

To use a module, add a `module block <https://www.terraform.io/docs/language/modules/syntax.html>`_
and specify the source as a `module archive <https://developer.hashicorp.com/terraform/language/modules/sources#fetching-archives-over-http>`_
URL. The URL should be in the format:

``https://github.com/frontierhq/azurerm-terraform-modules/releases/download/[module-name]/[version]/module.tar.gz//src``

For example:

.. code:: hcl

    module "resource_group" {
      source = "https://github.com/frontierhq/azurerm-terraform-modules/releases/download/resource-group/1.0.0/module.tar.gz//src"

      environment = "dev"
      identifier  = "k8s"
      location    = "uksouth"
      zone        = "shd"

      tags = {
        WorkloadType = "CustomerBankingLZ/container-platform"
      }
    }

See `Modules Overview <https://developer.hashicorp.com/terraform/language/modules>`_ for more information on Terraform Modules.

-------
Modules
-------

.. list-table::
   :widths: 25 25 50
   :header-rows: 1

   * - Module name
     - Latest version
     - Source URL
   * - `automation-account <https://github.com/frontierhq/azurerm-terraform-modules/tree/main/modules/automation-account>`__
     - `2.0.0 <https://github.com/frontierhq/azurerm-terraform-modules/releases/tag/automation-account%2F2.0.0>`__
     - ``https://github.com/frontierhq/azurerm-terraform-modules/releases/download/automation-account/2.0.0/module.tar.gz//src``
   * - `automation-runbook <https://github.com/frontierhq/azurerm-terraform-modules/tree/main/modules/automation-runbook>`__
     - `2.0.0 <https://github.com/frontierhq/azurerm-terraform-modules/releases/tag/automation-runbook%2F2.0.0>`__
     - ``https://github.com/frontierhq/azurerm-terraform-modules/releases/download/automation-runbook/2.0.0/module.tar.gz//src``
   * - `cdn-profile <https://github.com/frontierhq/azurerm-terraform-modules/tree/main/modules/cdn-profile>`__
     - `2.0.0 <https://github.com/frontierhq/azurerm-terraform-modules/releases/tag/cdn-profile%2F2.0.0>`__
     - ``https://github.com/frontierhq/azurerm-terraform-modules/releases/download/cdn-profile/2.0.0/module.tar.gz//src``
   * - `data-factory <https://github.com/frontierhq/azurerm-terraform-modules/tree/main/modules/data-factory>`__
     - `2.0.0 <https://github.com/frontierhq/azurerm-terraform-modules/releases/tag/data-factory%2F2.0.0>`__
     - ``https://github.com/frontierhq/azurerm-terraform-modules/releases/download/data-factory/2.0.0/module.tar.gz//src``
   * - `firewall <https://github.com/frontierhq/azurerm-terraform-modules/tree/main/modules/firewall>`__
     - `2.0.0 <https://github.com/frontierhq/azurerm-terraform-modules/releases/tag/firewall%2F2.0.0>`__
     - ``https://github.com/frontierhq/azurerm-terraform-modules/releases/download/firewall/2.0.0/module.tar.gz//src``
   * - `firewall-policy <https://github.com/frontierhq/azurerm-terraform-modules/tree/main/modules/firewall-policy>`__
     - `2.0.0 <https://github.com/frontierhq/azurerm-terraform-modules/releases/tag/firewall-policy%2F2.0.0>`__
     - ``https://github.com/frontierhq/azurerm-terraform-modules/releases/download/firewall-policy/2.0.0/module.tar.gz//src``
   * - `key-vault <https://github.com/frontierhq/azurerm-terraform-modules/tree/main/modules/key-vault>`__
     - `2.0.0 <https://github.com/frontierhq/azurerm-terraform-modules/releases/tag/key-vault%2F2.0.0>`__
     - ``https://github.com/frontierhq/azurerm-terraform-modules/releases/download/key-vault/2.0.0/module.tar.gz//src``
   * - `kubernetes-cluster <https://github.com/frontierhq/azurerm-terraform-modules/tree/main/modules/kubernetes-cluster>`__
     - `4.0.0 <https://github.com/frontierhq/azurerm-terraform-modules/releases/tag/kubernetes-cluster%2F4.0.0>`__
     - ``https://github.com/frontierhq/azurerm-terraform-modules/releases/download/kubernetes-cluster/4.0.0/module.tar.gz//src``
   * - `log-analytics-workspace <https://github.com/frontierhq/azurerm-terraform-modules/tree/main/modules/log-analytics-workspace>`__
     - `2.0.0 <https://github.com/frontierhq/azurerm-terraform-modules/releases/tag/log-analytics-workspace%2F2.0.0>`__
     - ``https://github.com/frontierhq/azurerm-terraform-modules/releases/download/log-analytics-workspace/2.0.0/module.tar.gz//src``
   * - `mysql-flexible-server <https://github.com/frontierhq/azurerm-terraform-modules/tree/main/modules/mysql-flexible-server>`__
     - `2.0.0 <https://github.com/frontierhq/azurerm-terraform-modules/releases/tag/mysql-flexible-server%2F2.0.0>`__
     - ``https://github.com/frontierhq/azurerm-terraform-modules/releases/download/mysql-flexible-server/2.0.0/module.tar.gz//src``
   * - `point-to-site-vpn-gateway <https://github.com/frontierhq/azurerm-terraform-modules/tree/main/modules/point-to-site-vpn-gateway>`__
     - `2.0.0 <https://github.com/frontierhq/azurerm-terraform-modules/releases/tag/point-to-site-vpn-gateway%2F2.0.0>`__
     - ``https://github.com/frontierhq/azurerm-terraform-modules/releases/download/point-to-site-vpn-gateway/2.0.0/module.tar.gz//src``
   * - `postgresql-flexible-server <https://github.com/frontierhq/azurerm-terraform-modules/tree/main/modules/postgresql-flexible-server>`__
     - `2.0.0 <https://github.com/frontierhq/azurerm-terraform-modules/releases/tag/postgresql-flexible-server%2F2.0.0>`__
     - ``https://github.com/frontierhq/azurerm-terraform-modules/releases/download/postgresql-flexible-server/2.0.0/module.tar.gz//src``
   * - `private-dns-resolver <https://github.com/frontierhq/azurerm-terraform-modules/tree/main/modules/private-dns-resolver>`__
     - `3.0.0 <https://github.com/frontierhq/azurerm-terraform-modules/releases/tag/private-dns-resolver%2F3.0.0>`__
     - ``https://github.com/frontierhq/azurerm-terraform-modules/releases/download/private-dns-resolver/3.0.0/module.tar.gz//src``
   * - `private-endpoint <https://github.com/frontierhq/azurerm-terraform-modules/tree/main/modules/private-endpoint>`__
     - `2.0.0 <https://github.com/frontierhq/azurerm-terraform-modules/releases/tag/private-endpoint%2F2.0.0>`__
     - ``https://github.com/frontierhq/azurerm-terraform-modules/releases/download/private-endpoint/2.0.0/module.tar.gz//src``
   * - `public-ip <https://github.com/frontierhq/azurerm-terraform-modules/tree/main/modules/public-ip>`__
     - `1.0.0 <https://github.com/frontierhq/azurerm-terraform-modules/releases/tag/public-ip%2F1.0.0>`__
     - ``https://github.com/frontierhq/azurerm-terraform-modules/releases/download/public-ip/1.0.0/module.tar.gz//src``
   * - `resource-group <https://github.com/frontierhq/azurerm-terraform-modules/tree/main/modules/resource-group>`__
     - `2.0.0 <https://github.com/frontierhq/azurerm-terraform-modules/releases/tag/resource-group%2F2.0.0>`__
     - ``https://github.com/frontierhq/azurerm-terraform-modules/releases/download/resource-group/2.0.0/module.tar.gz//src``
   * - `storage-account <https://github.com/frontierhq/azurerm-terraform-modules/tree/main/modules/storage-account>`__
     - `2.0.0 <https://github.com/frontierhq/azurerm-terraform-modules/releases/tag/storage-account%2F2.0.0>`__
     - ``https://github.com/frontierhq/azurerm-terraform-modules/releases/download/storage-account/2.0.0/module.tar.gz//src``
   * - `user-assigned-identity <https://github.com/frontierhq/azurerm-terraform-modules/tree/main/modules/user-assigned-identity>`__
     - `2.0.0 <https://github.com/frontierhq/azurerm-terraform-modules/releases/tag/user-assigned-identity%2F2.0.0>`__
     - ``https://github.com/frontierhq/azurerm-terraform-modules/releases/download/user-assigned-identity/2.0.0/module.tar.gz//src``
   * - `virtual-hub <https://github.com/frontierhq/azurerm-terraform-modules/tree/main/modules/virtual-hub>`__
     - `2.0.0 <https://github.com/frontierhq/azurerm-terraform-modules/releases/tag/virtual-hub%2F2.0.0>`__
     - ``https://github.com/frontierhq/azurerm-terraform-modules/releases/download/virtual-hub/2.0.0/module.tar.gz//src``
   * - `virtual-network <https://github.com/frontierhq/azurerm-terraform-modules/tree/main/modules/virtual-network>`__
     - `3.0.0 <https://github.com/frontierhq/azurerm-terraform-modules/releases/tag/virtual-network%2F3.0.0>`__
     - ``https://github.com/frontierhq/azurerm-terraform-modules/releases/download/virtual-network/3.0.0/module.tar.gz//src``
   * - `virtual-network-gateway <https://github.com/frontierhq/azurerm-terraform-modules/tree/main/modules/virtual-network-gateway>`__
     - `1.0.0 <https://github.com/frontierhq/azurerm-terraform-modules/releases/tag/virtual-network-gateway%2F1.0.0>`__
     - ``https://github.com/frontierhq/azurerm-terraform-modules/releases/download/virtual-network-gateway/1.0.0/module.tar.gz//src``
   * - `virtual-wan <https://github.com/frontierhq/azurerm-terraform-modules/tree/main/modules/virtual-wan>`__
     - `2.0.0 <https://github.com/frontierhq/azurerm-terraform-modules/releases/tag/virtual-wan%2F2.0.0>`__
     - ``https://github.com/frontierhq/azurerm-terraform-modules/releases/download/virtual-wan/2.0.0/module.tar.gz//src``
   * - `vpn-server-configuration <https://github.com/frontierhq/azurerm-terraform-modules/tree/main/modules/vpn-server-configuration>`__
     - `2.0.0 <https://github.com/frontierhq/azurerm-terraform-modules/releases/tag/vpn-server-configuration%2F2.0.0>`__
     - ``https://github.com/frontierhq/azurerm-terraform-modules/releases/download/vpn-server-configuration/2.0.0/module.tar.gz//src``

------------
Contributing
------------

We welcome contributions to this repository. Please see `CONTRIBUTING.md <https://github.com/frontierhq/azurerm-terraform-modules/tree/main/CONTRIBUTING.md>`_ for more information.
