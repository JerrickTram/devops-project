variable "project_id" { }

variable "credentials" { 
    type = string
    sensitive = true
}

variable "regions" {
  default = "us-east5"
}

variable "zones" {
  default = "us-east5-a"
}

variable "machine" {
  default = "e2-small"
}

variable "node_count" {
  default = "3"
}

variable "image" {
  default = "debian-cloud/debian-11"
}