output "instance_ip" {
  value = google_compute_instance.vm_instance.*.name
}