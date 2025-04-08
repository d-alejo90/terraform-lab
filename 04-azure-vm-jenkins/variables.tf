variable "location" {
  default = "East US"
}

variable "vm_admin_username" {
  default = "azureuser"
}

variable "vm_name" {
  default = "jenkinsvm"
}

variable "resource_group_name" {
  default = "jenkins-rg"
}

variable "instance_size" {
  default = "Standard_B1ls" # Capa gratuita elegible
}

variable "subscription_id" {
  type      = string
  sensitive = true
}

