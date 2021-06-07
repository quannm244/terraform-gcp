terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.70.0"
    }
  }
}

module "gce" {
  source        = "./modules/gce"
  instance_name = "new-instance"
  network       = "default"
}

module "vpc" {
  source       = "./modules/network/vpc"
  network_name = "new-network"
  project_id = "ivory-bonus-314308"
  mtu = 1500
}

module "subnets" {
    source  = "./modules/network/subnets"
    project_id   = "ivory-bonus-314308"
    network_name = "new-network"
    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-central1"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-central1"
        },
        {
            subnet_name               = "subnet-03"
            subnet_ip                 = "10.10.30.0/24"
            subnet_region             = "us-central1"
        }
    ]
    depends_on = [module.vpc]
}

module "cloudsql" {
  source        = "./modules/cloudsql"
  instance_name = "test-dbinstance"
  allowed_ip    = module.gce.vm_public_ip
}


