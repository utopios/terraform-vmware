data "vsphere_virtual_machine" "template" {
  name          = var.vsphere_vm_information.template
  datacenter_id = var.vsphere_datacenter_id
}

resource "vsphere_virtual_machine" "vm" {
  name             = var.vsphere_vm_information.name
  resource_pool_id = var.vsphere_resource_pool_id
  datastore_id     = var.vsphere_datastore_id
  num_cpus         = var.vsphere_vm_information.cpu
  memory           = var.vsphere_vm_information.memory
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  network_interface {
    network_id   = var.vsphere_network_id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  disk {
    label            = var.vsphere_vm_information.disk_label
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = var.vsphere_custom_information.host_name
        domain    = var.vsphere_custom_information.domain
      }
      network_interface {
        ipv4_address = var.vsphere_custom_information.ipv4_address
        ipv4_netmask = var.vsphere_custom_information.ipv4_netmask
      }
      ipv4_gateway = var.vsphere_custom_information.ipv4_gateway
    }
  }
  extra_config = var.vsphere_custom_information.extra_config
}