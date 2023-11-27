# terraform {
#   required_providers {
#     vsphere = "addresse.registry/mon/vsphere"
#     version = "2.5.1"
#   }
# }

variable "vsphere_user" {
  description = "vsphere user"
  type = string
}


variable "vsphere_password" {
  description = "vsphere password"
  type = string
}

variable "vsphere_server_address" {
  description = "vsphere address"
  type = string
  # A ne pas faire
  default = "192.168.29.131"
}



provider "vsphere" {
    user = var.vsphere_user
    password = var.vsphere_password
    vsphere_server = var.vsphere_server_address
    allow_unverified_ssl = true
}

data "vsphere_datacenter" "datacenter" {
  name = "Datacenter"
}

data "vsphere_network" "network" {
  name = "VM Network"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

output "information_network_type" {
  value = data.vsphere_network.network.type
}

output "information_network_id" {
  value = data.vsphere_network.network.id
}