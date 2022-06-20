##############################################################################
# Create Public Gateways
##############################################################################

locals {
  # create object that only contains gateways that will be created
  gateway_map = {
    for zone in keys(var.public_gateways) :
    zone => replace(zone, "zone", var.region) if lookup(var.public_gateways, zone, null) == true
  }
}

##############################################################################

##############################################################################
# Public Gateways
##############################################################################

resource "ibm_is_public_gateway" "gateway" {
  for_each       = local.gateway_map
  name           = "${var.prefix}-public-gateway-${each.key}"
  vpc            = var.vpc_id
  resource_group = var.resource_group_id
  zone           = each.value
}

##############################################################################