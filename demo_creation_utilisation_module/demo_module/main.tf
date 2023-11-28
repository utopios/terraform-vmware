## La création des resources ou datas
data "vsphere_datacenter" "datacenter" {
  name = var.vsphere_datacenter_name
}