variable "vsphere_datacenter_id" {
  type = number
}

variable "vsphere_resource_pool_id" {
  type = number
}
variable "vsphere_datastore_id" {
  type = number
}

variable "vsphere_network_id" {
  type = number
}

variable "vsphere_vm_information" {
  type = object({
    name = string
    template = string
    disk_label = string
    memory = number
    cpu = number 
  })
}

variable "vsphere_custom_information" {
    type = object({
      host_name = string
      domain = string
      ipv4_address = string
      ipv4_netmask = number
      ipv4_gateway = string
      extra_config = map(string)
    })
}

