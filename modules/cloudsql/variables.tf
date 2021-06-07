# variable database_name {
#     description = "Name of the database"
# }

variable "instance_name" {
  description = "Name of the instance"
}

variable "region" {
  description = "region to create database in"
  default     = "us-central1"
}

variable "db_tier" {
  description = "database tier"
  default     = "db-f1-micro"
}

variable "allowed_ip" {

}

variable "password" {
    default = "Passw0rd@123"
}