
output "ip" {
        description = "vm_ip"
    value = azurerm_linux_virtual_machine.main_vm.public_ip_address
}

output "node_1" {
    description = "Node-1 VM IP"
    value = azurerm_linux_virtual_machine.node-1.public_ip_address  
}

output "node-2" {
    description = "Node-2 VM IP"
    value = azurerm_linux_virtual_machine.node-2.public_ip_address  
}

# output "node-3" {
#     description = "Node-3 VM IP"  
#     value = azurerm_linux_virtual_machine.node-3.public_ip_address
# }

# output "node-4" {
#     description = "Node-4 VM IP"
#     value = azurerm_linux_virtual_machine.node-4.public_ip_address
# }

# output "node-5" {
#     description = "Node-5 VM IP"
#     value = azurerm_linux_virtual_machine.node-5.public_ip_address  
# }