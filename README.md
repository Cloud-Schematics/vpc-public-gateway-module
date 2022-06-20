# VPC Public Gateway Module

This module is used to create Public Gateways in 1, 2, or 3 zones of a single VPC.

---

## Table of Contents 

1. [Module Variables](#module-variables)
2. [Public Gateways Variable](#public-gateways-variable)
3. [Example Usage](#example-usage)

---

## Module Variables

Name              | Type   | Description                                                 | Sensitive | Default
----------------- | ------ | ----------------------------------------------------------- | --------- | -------
prefix            | string | The prefix that you would like to append to your resources  |           | 
vpc_id            | string | ID of the VPC where address prefixes will be created        |           | 
region            | string | The region to which to deploy the VPC                       |           | 
resource_group_id | string | ID of the resource group where gateways will be provisioned |           | null
public_gateways   | object | See below | | See below

---

## Public Gateways Variable

```terraform
variable "public_gateways" {
  description = "Create a public gateway in any of the three zones with `true`."
  type = object({
    zone-1 = optional(bool)
    zone-2 = optional(bool)
    zone-3 = optional(bool)
  })
  default = {
    zone-1 = true
    zone-2 = true
    zone-3 = true
  }
}
```

## Example Usage

```terraform

##############################################################################
# Public Gateways
##############################################################################

module "public_gateways" {
  source            = "https://github.com/Cloud-Schematics/vpc-public-gateway-module.git"
  prefix            = var.prefix
  vpc_id            = ibm_is_vpc.vpc.id
  region            = var.region
  resource_group_id = data.ibm_resource_group.resource_group.id
  public_gateways   = var.use_public_gateways
}

##############################################################################

```