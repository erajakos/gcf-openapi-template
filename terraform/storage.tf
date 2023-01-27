resource "google_storage_bucket" "functions_bucket" {
  name     = var.functions_bucket
  location = var.gcp_region
}