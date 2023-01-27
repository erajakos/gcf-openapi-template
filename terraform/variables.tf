# Bucket to store the functions code
variable "functions_bucket" {
  type        = string
  description = "GCP bucket for functions code"
}

# Folder to contain the functions
variable "functions_dir" {
  type        = string
  description = "Path to functions directory"
}

# GCP authentication file
variable "gcp_auth_file" {
  type        = string
  description = "GCP authentication file"
}

# define GCP region
variable "gcp_region" {
  type        = string
  description = "GCP region"
}

# define GCP project name
variable "gcp_project" {
  type        = string
  description = "GCP project name"
}