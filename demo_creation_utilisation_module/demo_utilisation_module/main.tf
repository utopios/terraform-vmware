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

module "demo_module" {
  # source = "../demo_module"
  # source = "orsys.com/demo_module"
  source = "git::https://github.com/utopios/demo_module_terraform_vmware.git"
  vsphere_datacenter_name = "Datacenter"
}

output "sortie_module_datacenter_id" {
  value = module.demo_module.result_datacenter_id
  description = "sortie du module"
}