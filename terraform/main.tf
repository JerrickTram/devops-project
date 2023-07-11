provider "google" {
    project     = var.project_id
    credentials = file(var.project_id)
    region      = var.regions
    zone        = var.zones
}