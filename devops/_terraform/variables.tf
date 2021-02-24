variable "project_id" {
  description = "Google Project ID."
  type        = string
  default = "pruebas-301501"
}

variable "bucket_name" {
  description = "GCS Bucket name. Value should be unique ."
  type        = string
  default = "my-bucket-for-terraform"
}

variable "region" {
  description = "Google Cloud region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Google Cloud zone"
  type        = string
  default     = "us-central1-a"
}