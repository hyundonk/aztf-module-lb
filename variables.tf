variable "name" {
  description = "(Required) service name"   
}

variable "location" {
  description = "(Required) Location of the public IP to be created"   
}

variable "rg" {
  description = "(Required) Resourge group of the public IP to be created"    
}

variable "tags" {
  description = "(Required) Tags to be applied to the IP address to be created"
  
}

variable "sku" {
  description = "(Required) load balancer sku. Standard or Basic"
}

variable "subnet_ip_offset" {
  description = "ip address offset in the subnet which will be used for load balancer frontend ip address"
}

variable "subnet_id" {
  description = "subnet ID for the internal load balancer"
}

variable "protocol" {
  description = "probe protocol. Http, Https, or Tcp"
  default   = "Tcp"
}

variable "port" {
  description = "probe port. (1 ~ 65535)"
  default   = "22"
}

variable "interval" {
  description = "probe interval in sec."
  default   = "5"
}

variable "number_of_probes" {
  description = "number of probes"
  default   = "2"
}



/*
variable "diagnostics_map" {
  description = "(Required) Storage account and Event Hub for the IP address diagnostics"  

}

variable "log_analytics_workspace_id" {
  description = "(Required) Log Analytics ID for the IP address diagnostics"
  
}

variable "diagnostics_settings" {
 description = "(Required) Map with the diagnostics settings for public IP deployment"
}
*/
