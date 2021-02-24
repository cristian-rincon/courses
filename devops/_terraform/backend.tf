terraform {
  backend "gcs" {
    bucket  = "my-bucket-for-terraform"
    prefix  = "terraform/state"
  }
}