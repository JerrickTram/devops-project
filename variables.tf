variable "project_id" { }

variable "credentials" { 
    type = string
    sensitive = true
}

variable "vm_params" {
    type = tuple({string, string, string, bool})
    description = "vm parameters"
    default = ["e2-small", "us-east5", "us-east5-a", true]
}

variable "node_count" {
  default = "3"
}

variable "image" {
  default = "cos-cloud/cos-stable"
}