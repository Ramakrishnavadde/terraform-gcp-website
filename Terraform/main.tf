provider "google" {
  credentials = file("service-account-key.json")
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "static_site" {
  name     = var.bucket_name
  location = var.region

  website {
    main_page_suffix = "index.html"
    not_found_page   = "index.html"
  }

  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "website_files" {
  for_each = fileset(var.website_path, "*")

  name   = each.value
  bucket = google_storage_bucket.static_site.name
  source = "${var.website_path}/${each.value}"

  content_type = lookup(
    {
      html = "text/html"
      css  = "text/css"
      js   = "application/javascript"
    },
    split(".", each.value)[1],
    "application/octet-stream"
  )
}

resource "google_storage_bucket_iam_member" "public_rule" {
  bucket = google_storage_bucket.static_site.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}

output "website_url" {
  value = "http://${google_storage_bucket.static_site.name}.storage.googleapis.com/index.html"
}
