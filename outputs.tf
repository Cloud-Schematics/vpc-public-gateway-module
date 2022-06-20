##############################################################################
# Outputs
##############################################################################

output "gateways" {
  description = "Map of public gateway IDs by zone."
  value = {
    for zone in ["zone-1", "zone-2", "zone-3"] :
    zone => (
      lookup(ibm_is_public_gateway.gateway, zone, null) == null
      ? null
      : ibm_is_public_gateway.gateway[zone].id
    )
  }
}

##############################################################################