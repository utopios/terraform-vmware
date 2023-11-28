terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.5.1"
    }
    tls = {
      source = "hashicorp/tls"
      version = "4.0.5"
    }
  }
}

provider "tls" {
  
}


provider "tls" {
  
}

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits = 2048
}

resource "local_file" "private_key" {
  content = tls_private_key.ssh_key.private_key_pem
  filename = "${path.module}/ssh_key"
}

locals {
  vsphere_vm_ssh_info = {
    ssh_username = "admin"
    public_key = tls_private_key.ssh_key.public_key_openssh
  }
}

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

module "custom_vm" {
    source = "../correction_lab_module_vm"
    vsphere_datacenter_id = data.vsphere_datacenter.datacenter.id
    vsphere_resource_pool_id = data.vsphere_host.host.resource_pool_id
    vsphere_datastore_id = data.vsphere_datastore.datastore.id
    vsphere_network_id = data.vsphere_network.network.id
    vsphere_vm_information = {
      cpu = 1
      memory = 1024
      template = "ubuntu"
      disk_label = "disk_label"
      name = "custom_vm"
    }
    vsphere_custom_information = {
      "guestinfo.userdata" = base64encode(templatefile("${path.module}/templates/userdata.yml", local.vsphere_vm_ssh_info))
    }
}

output "guest_ip_addresses" {
  value = module.custom_vm.ip_addresses
}

output "vm_state" {
  value = module.custom_vm.power_state
}