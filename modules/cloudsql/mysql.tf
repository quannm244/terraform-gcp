# resource "google_sql_database" "mysql" {
#     name = var.database_name

# }
resource "random_id" "id" {
  byte_length = 4
}

resource "google_sql_database_instance" "mysql_instance" {
  name             = "${var.instance_name}-${random_id.id.hex}"
  database_version = "MYSQL_5_6"
  region           = var.region
  settings {
    tier = var.db_tier
    ip_configuration {
      authorized_networks {
        name  = "test"
        value = var.allowed_ip
      }
      # # for_each = var.allowed_vm
      # # iterator = allow_vm
      # content {
      #     # name  = allow_vm.value.name
      #     # value = allow_vm.value.network_interface.0.access_config.0.nat_ip
      #      value = var.allowed_ip
      # }
    }

  }

  deletion_protection = "false"

  timeouts {
    create = "10m"
    delete = "30m"
  }
}

resource "google_sql_user" "users" {
  name     = "quannm244"
  instance = google_sql_database_instance.mysql_instance.name
  password = var.password
}