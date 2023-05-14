resource "google_compute_instance" "app_server" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = ["app-server"]

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = google_compute_network.network.self_link
    access_config {
      // Allocate a one-to-one NAT IP address for the instance
    }
  }

  metadata_startup_script = var.startup_script
}

# Create the network
resource "google_compute_network" "network" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

# Create the subnet
resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_ip_cidr_range
  network       = google_compute_network.network.self_link
}

# Create firewall rules
resource "google_compute_firewall" "http" {
  name    = "allow-http"
  network = google_compute_network.network.self_link

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "ssh" {
  name    = "allow-ssh"
  network = google_compute_network.network.self_link

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

