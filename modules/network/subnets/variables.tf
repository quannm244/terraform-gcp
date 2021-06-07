variable "project_id" {
  description = "The ID of the project where subnets will be created"
}

variable "network_name" {
  description = "The name of the network where subnets will be created"
}

variable "subnets" {
  type        = list(map(string))
  description = "The list of subnets being created"
}