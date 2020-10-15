output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "hadoop_resource" {
  value = azurerm_resource_group.hadoop
}

output "hadoop_network" {
  value = azurerm_virtual_network.hadoop
}
