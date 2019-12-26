
output "backend_address_pool_id" {
	value = azurerm_lb_backend_address_pool.lb.id
}

output "frontend_ip" {
  value = azurerm_lb.lb.frontend_ip_configuration
}

output "depended_on" {
  value = null_resource.dependency_setter.id
}

