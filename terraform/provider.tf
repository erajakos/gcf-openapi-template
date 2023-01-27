provider "google" {
  credentials = var.gcp_auth_file
  project = var.gcp_project
  region = var.gcp_region
}

terraform {
  required_providers {
    google = {
      source = "hashicorp/google-beta"
      version = "4.50.0"
    }
  }
}