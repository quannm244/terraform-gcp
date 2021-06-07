variable "network_name" {
  description = "The name of the network being created"
  default     = ""
}

variable "auto_creation" {
  type        = bool
  description = "Auto create subnet option"
  default     = false
}

variable "project_id" {
  description = "Project ID to create network in"
  default     = ""
}

variable "mtu" {
  type        = number
  description = "max transmission unit"
  default     = 0
}