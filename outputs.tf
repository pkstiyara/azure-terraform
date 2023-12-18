
output "ip" {
    description = "vm_ip"
    value = azurerm_linux_virtual_machine.main_vm.public_ip_address
}

output "jenkins_URL" {
    description = "Jenkins URL"
    value = "http://${azurerm_linux_virtual_machine.main_vm.public_ip_address}:8080"
  
}

output "node_1_vm_ip" {
    description = "node-1_ip"
    value = azurerm_linux_virtual_machine.node-1.public_ip_address  
}

output "node_2_vm_ip" {
  description = "node-2-public-ip"
  value = azurerm_linux_virtual_machine.node-2.public_ip_address
}

output "node_3_public_ip" {
    description = "node-3-public-ip"
    value = azurerm_linux_virtual_machine.node-3.public_ip_address  
}