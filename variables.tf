variable "project_id" { }

variable "credentials" { 
    type = string
    sensitive = true
}

variable "vm_params" {
    type        = object({
        name                        = string
        machine_type                = string
        region                      = string
        zone                        = string
        allow_stopping_for_update   = bool
    })
    description = "vm parameters"
    default     = {
        name                        = "terraform-instance"
        machine_type                = "e2-micro"
        region                      = "us-east5"
        zone                        = "us-east5-a"
        allow_stopping_for_update   = true
    }

    validation {
        condition       = length(var.vm_params.name) > 3
        error_message   = "VM name must be longer than 3 characters."
    }
}

variable "node_count" {
  default = "1"
}

variable "image" {
  default = "debian-cloud/debian-11"
}