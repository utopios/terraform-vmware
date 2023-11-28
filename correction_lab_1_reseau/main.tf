provider "vsphere" {
    user = var.vsphere_user
    password = var.vsphere_password
    vsphere_server = var.vsphere_server_address
    allow_unverified_ssl = true
}

data "vsphere_datacenter" "datacenter" {
  name = var.vsphere_datacenter_name
}


data "vsphere_network" "network" {
  name = var.vsphere_network_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}


data "vsphere_host" "host" {
    name = var.vsphere_host_name
    datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_host_virtual_switch" "standard_switch" {
    name = var.vsphere_vswitch_information.name
    host_system_id = data.vsphere_host.host.id
    network_adapters = var.vsphere_vswitch_information.network_adapters
    active_nics = var.vsphere_vswitch_information.active_nics
    # d'autres configurations possible voir doc vsphere ...
}