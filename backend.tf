terraform {
  backend "gcs" {
    bucket  = "cccm-tf-state"
    prefix  = "test"
    credentials = "/Users/quannm/Learn/Terraform/creds/ivory-bonus-314308-8e9aa0ead113.json"
  }
}