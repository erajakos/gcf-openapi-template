# API Gateway
resource "google_api_gateway_api" "api_gw" {
  provider = google
  project  = var.gcp_project
  api_id = "api-gw"
}

# API Gateway config
resource "google_api_gateway_api_config" "api_gw" {
  depends_on = [local_file.openapi_resolved]
  provider = google
  project  = var.gcp_project
  api = google_api_gateway_api.api_gw.api_id
  api_config_id = "gw"

  openapi_documents {
    document {
      path = "${var.functions_dir}/openapi.yml"
      contents = base64encode(data.template_file.openapi.rendered)
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "google_api_gateway_gateway" "api_gw" {
  provider = google-beta
  api_config = google_api_gateway_api_config.api_gw.id
  gateway_id = "api-gw"
}

output "api_baseurl" {
    value = google_api_gateway_gateway.api_gw.default_hostname
}