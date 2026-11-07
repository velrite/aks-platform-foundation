variable "subscription_id" {
  type        = string
  description = "Azure subscription ID to deploy into"
}
variable "location" {
  type    = string
  default = "uksouth"
}
variable "name_prefix" {
  type    = string
  default = "aksfound"
}
variable "environment" {
  type    = string
  default = "dev"
}
variable "node_vm_size" {
  type    = string
  default = "Standard_D2s_v5"
}
variable "node_min_count" {
  type    = number
  default = 1
}
variable "node_max_count" {
  type    = number
  default = 3
}
