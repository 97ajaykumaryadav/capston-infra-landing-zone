variable "aks_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "dns_prefix" {}
variable "node_count" {
  default = 1
}
variable "vm_size" {
  default = "Standard_b2as_v2"
}
variable "tags" {}