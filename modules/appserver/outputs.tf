output "app_server_instance_name" {
  description = "The name of the Compute Engine instance"
  value       = google_compute_instance.app_server.name
}

output "app_server_instance_ip" {
  description = "The internal IP address of the Compute Engine instance"
  value       = google_compute_instance.app_server.network_interface.0.access_config.0.nat_ip
}

output "network_name" {
  value = google_compute_network.network.name
}

output "subnet_name" {
  value = google_compute_subnetwork.subnet.name
}

output "subnet_ip_cidr_range" {
  value = google_compute_subnetwork.subnet.ip_cidr_range
}