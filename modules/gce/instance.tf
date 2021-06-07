resource "google_compute_instance" "vm_instance" {
  name                      = var.instance_name
  machine_type              = var.machine_type
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = var.network

    access_config {
      // Ephemeral IP
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt install mysql-client-core-5.7 -y"
      #   "mysql -h $ -u quannm244 -e 'CREATE DATABASE IF NOT EXISTS testing;'"
    ]

    connection {
      type        = "ssh"
      user        = "quannm244"
      private_key = file("/Users/quannm/.ssh/gcp")
      host        = self.network_interface.0.access_config.0.nat_ip
    }

  }
}