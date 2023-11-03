
output "ip" {
        description = "vm_ip"
    value = azurerm_linux_virtual_machine.main_vm.public_ip_address
}

output "node_1" {
    description = "Node-1 VM IP"
    value = azurerm_linux_virtual_machine.node-1.public_ip_address  
}

output "node-1" {
    description = "Node-2 VM IP"
    value = azurerm_linux_virtual_machine.node-2.public_ip_address  
}