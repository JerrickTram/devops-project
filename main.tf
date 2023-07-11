provider "google" {
    project     = var.project_id
    credentials = "${var.credentials}"
    region      = var.regions
    zone        = var.zones
}

resource "google_compute_instance" "test-node-" {
    count                       = "${var.node_count}"
    name                        = "test-node-${count.index}"
    machine_type                = "${var.machine}"
    zone                        = "${var.zones}"
    allow_stopping_for_update   = true

    boot_disk {
        initialize_params {
            image   = "${var.image}"
        }
    }

    network_interface {
        network = "default"
        access_config {
            // Ephemeral IP
        }
    }
}