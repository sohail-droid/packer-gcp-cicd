variable "project_id" {
  default = "training-2024-batch"
}

variable "zone" {
  default = "us-central1-a"
}

variable "machine_type" {
  default = "e2-medium"
}

variable "source_image_family" {
  default = "ubuntu-2204-lts"
}

variable "source_image_project_id" {
  type    = list(string)
  default = ["ubuntu-os-cloud"]
}

variable "ssh_username" {
  default = "ubuntu"
}

variable "image_name" {
  default = "packer-nginx-{{timestamp}}"
}

variable "network" {
  default = "default"
}

variable "subnetwork" {
  default = "default"
}