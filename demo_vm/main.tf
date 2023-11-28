provider "vsphere" {
    user = var.vsphere_user
    password = var.vsphere_password
    vsphere_server = var.vsphere_server_address
    allow_unverified_ssl = true
}

data "vsphere_datacenter" "datacenter" {
  name = var.vsphere_datacenter_name
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}



data "vsphere_network" "network" {
  name = var.vsphere_network_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}


data "vsphere_host" "host" {
    name = var.vsphere_host_name
    datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = var.vsphere_vm_information.name
  resource_pool_id = data.vsphere_host.host.id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = 1
  memory           = 1024
  guest_id         = "other3xLinux64Guest"
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  disk {
    label = var.vsphere_vm_information.disk_label
    size  = var.vsphere_vm_information.disk_size
  }
}