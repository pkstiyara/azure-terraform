
output "ip" {
    description = "vm_ip"
    value = azurerm_linux_virtual_machine.main_vm.public_ip_address
}

output "key_data" {
  value = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
}