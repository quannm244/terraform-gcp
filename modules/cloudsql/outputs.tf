output "public_ip" {
  value = google_sql_database_instance.mysql_instance.public_ip_address
}