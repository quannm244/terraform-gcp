provider "google" {
  project     = "ivory-bonus-314308"
  region      = "us-central1"
  zone        = "us-central1-a"
  credentials = file("/Users/quannm/Learn/Terraform/creds/ivory-bonus-314308-8e9aa0ead113.json")
}