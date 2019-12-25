
resource "azurerm_lb" "lb" {
  name		              = "${format("%s-lb", var.name)}"
  location              = var.location
  resource_group_name   = var.rg

  sku = var.sku
    
  frontend_ip_configuration {
    name                          = "lb-frontend-ip"
    subnet_id                     = var.subnet_id
    private_ip_address            = var.frontend_ip_address
    private_ip_address_allocation = "Static"
  }
}

resource "azurerm_lb_probe" "probe" {
    resource_group_name       = azurerm_lb.lb.resource_group_name
    loadbalancer_id           = azurerm_lb.lb.id
    name                      = "${azurerm_lb.lb.name}-probe"
    protocol                  = var.protocol
    port                      = var.port

    interval_in_seconds       = var.interval
    number_of_probes          = var.number_of_probes
}

resource "azurerm_lb_backend_address_pool" "lb" {
    resource_group_name             = azurerm_lb.lb.resource_group_name
    loadbalancer_id                 = azurerm_lb.lb.id
    name                            = "backendpool"
}

resource "azurerm_lb_rule" "https" {
    resource_group_name             = azurerm_lb.lb.resource_group_name
    loadbalancer_id                 = azurerm_lb.lb.id

	  name		                        = "https"
    
    protocol                        = "Tcp"
    frontend_port                   = 443
    backend_port                    = 443

    frontend_ip_configuration_name  = "lb-frontend-ip"
    
	  backend_address_pool_id         = azurerm_lb_backend_address_pool.lb.id
    probe_id                        = azurerm_lb_probe.probe.id
    depends_on                      = ["azurerm_lb_probe.probe"]

    enable_floating_ip              = true
	  idle_timeout_in_minutes         = 4
	  load_distribution               = "Default"
	  disable_outbound_snat           = true
}

resource "azurerm_lb_rule" "http" {
    resource_group_name             = azurerm_lb.lb.resource_group_name
    loadbalancer_id                 = azurerm_lb.lb.id

	  name		                        = "http"
 
    protocol                        = "Tcp"
    frontend_port                   = 80
    backend_port                    = 80
    
    frontend_ip_configuration_name  = "lb-frontend-ip"
    
    backend_address_pool_id         = azurerm_lb_backend_address_pool.lb.id
    probe_id                        = azurerm_lb_probe.probe.id
    depends_on                      = ["azurerm_lb_probe.probe"]

    enable_floating_ip              = true
	  idle_timeout_in_minutes         = 4
	  load_distribution               = "Default"
	  disable_outbound_snat           = true
}

