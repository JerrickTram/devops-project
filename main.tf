provider "google" {
  project     = var.project_id
  credentials = "${file(var.credentials)}"
  region      = var.regions
  zone        = var.zones
}

resource "google_compute_instance" "test-node-" {
  count                     = var.node_count
  name                      = "test-node-${count.index}"
  machine_type              = var.machine
  zone                      = var.zones
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = google_compute_network.terraform_network.self_link
    subnetwork = google_compute_subnetwork.terraform_subnet.self_link
    access_config {
      // Ephemeral IP
    }
  }
}

resource "google_compute_network" "terraform_network" {
    name                        = "terraform-network"
    auto_create_subnetworks     = false

}

resource "google_compute_subnetwork" "terraform_subnet" {
    name                        = "terraform-subnetwork"
    ip_cidr_range               = "10.202.0.0/20"
    region                      = var.regions
    network                     = google_compute_network.terraform_network.id
}