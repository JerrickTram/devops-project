provider "google" {
    project     = var.project_id
    credentials = file("google_cloud_cred.json")
    region      = var.region
    zone        = var.zone
}