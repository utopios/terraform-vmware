output "ip_addresses" {
  description = "List vm Ip addresses"
  value = vsphere_virtual_machine.vm.guest_ip_addresses
}

output "power_state" {
  description = "power state"
  value = vsphere_virtual_machine.vm.power_state
}

