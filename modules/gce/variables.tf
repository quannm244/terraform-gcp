variable "machine_type" {
  default = "f1-micro"
}

variable "instance_name" {
  default = ""
}

variable "network" {
  description = "Network to deploy to. Only one of network or subnetwork should be specified."
  default     = ""
}

variable "subnetwork" {
  description = "Subnetwork to deploy to"
  default     = ""
}