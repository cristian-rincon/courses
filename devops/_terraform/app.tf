provider "google" {
  project = "pruebas-301501"
  region = "us-central1"
  zone = "us-central1-a"
}

module "app" {
  source        = "./modulos/instance"
  instance_name = var.instance_name
  instance_type = var.instance_type
}