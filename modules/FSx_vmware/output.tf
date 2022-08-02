output "vm_ip" {
  value = data.vsphere_virtual_machine.aws_sg.guest_ip_addresses[0]
}
