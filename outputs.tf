
output "ip" {
    description = "vm_ip"
    value = azurerm_linux_virtual_machine.main_vm.public_ip_address
}