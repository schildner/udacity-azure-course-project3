# Azure GUIDS
#variable "subscription_id" {}
#variable "client_id" {}
#variable "client_secret" {}
#variable "tenant_id" {}

# Resource Group/Location
variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
}
variable "resource_group" {
  description = "The resource group for the module's resources."
}
variable "application_type" {
  description = "Globally unique name for the application."
}

# Network
variable virtual_network_name {

}
variable address_prefix_test {
  description = "The address prefix."
}
variable address_space {
  description = "List of address spaces."
  type    = list(string)
}

