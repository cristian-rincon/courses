provider "google" {
  project = var.project_id
  region = var.region
  zone = var.zone

}


resource "google_storage_bucket" "my_bucket" {
  name     = var.bucket_name
  location = var.region
  force_destroy = true
}

resource "google_storage_bucket_iam_member" "member1" {
  depends_on = [google_storage_bucket.my_bucket]
  bucket = var.bucket_name
  role = "roles/storage.objectAdmin"
  member = "user:cristian.o.rincon.b@gmail.com"
}