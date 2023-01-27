data "template_file" "openapi" {
  template = "${file("${var.functions_dir}/openapi.yml")}"
  vars = {
    helloWorld_url = "${google_cloudfunctions_function.helloWorld.https_trigger_url}"
  }
}

resource "local_file" "openapi_resolved" {
  content  = "${data.template_file.openapi.rendered}"
  filename = "${var.functions_dir}/openapi_resolved.yml"
  depends_on = [data.template_file.openapi]
}