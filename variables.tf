##############################################################################
# Public Gateways
##############################################################################

variable "prefix" {
  description = "The prefix that you would like to append to your resources"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where address prefixes will be created"
  type        = string
}

variable "region" {
  description = "The region to which to deploy the VPC"
  type        = string
}

variable "resource_group_id" {
  description = "ID of the resource group where gateways will be provisioned"
  type        = string
  default     = null
}

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

  validation {
    error_message = "Keys for `use_public_gateways` must be in the order `zone-1`, `zone-2`, `zone-3`."
    condition     = keys(var.public_gateways)[0] == "zone-1" && keys(var.public_gateways)[1] == "zone-2" && keys(var.public_gateways)[2] == "zone-3"
  }
}

##############################################################################
