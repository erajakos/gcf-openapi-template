# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Hello world function
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Archive function as zip
data "archive_file" "helloWorld_archive" {
  type         = "zip"
  source_dir   = "${var.functions_dir}/helloWorld"
  output_path  = "${var.functions_dir}/helloWorld.zip"
}

# Upload function archive to cloud storage
resource "google_storage_bucket_object" "helloWorld_object" {
  name = "helloWorld.zip"
  bucket = google_storage_bucket.functions_bucket.name
  source = data.archive_file.helloWorld_archive.output_path
}

# Hello world function
resource "google_cloudfunctions_function" "helloWorld" {
  name = "helloWorld"
  runtime = "python37"
  entry_point = "hello_world"
  trigger_http = true
  source_archive_bucket = var.functions_bucket
  source_archive_object = "helloWorld.zip"
}

output "hello_wold_url" {
    value = google_cloudfunctions_function.helloWorld.https_trigger_url
}
