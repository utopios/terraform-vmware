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

variable "vsphere_datacenter_name" {
  description = "vsphere datacenter name"
  type = string
  default = "Datacenter"
}

variable "vsphere_network_name" {
  description = "vsphere network name"
  type = string
  default = "VM Network"
}

variable "vsphere_host_name" {
  description = "vsphere host name"
  type = string
  default = "192.168.29.130"
}

variable "vsphere_vswitch_information" {
  description = "Information of vswitch"
  type = object({
    name = string
    network_adapters = list(string)
    active_nics = list(string)
  })
  default = {
    name = "name of vswitch"
    network_adapters = [ "vmnic0" ]
    active_nics = [ "vmnic0" ]
  }
}

variable "vsphere_port_group_list" {
  description = "List of port group"
  type = list(string)
  default = [ "port_group_1", "port_group_2", "port_group_3" ]
}

variable "vsphere_port_group_extra_group" {
  description = "extra group port"
  type = bool
  default = false
}