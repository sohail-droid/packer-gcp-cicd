variable "project_id" {
  type    = string
  default = "training-2024-batch"
}

variable "instance_name" {
  type    = string
  default = "gcp-packer-test-vm"
}

variable "zone" {
  type    = string
  default = "us-central1-a"
}

variable "machine_type" {
  type    = string
  default = "e2-medium"
}

variable "source_image_family" {
  type    = string
  default = "ubuntu-2204-lts"
}

variable "source_image_project_id" {
  type    = string
  default = "ubuntu-os-cloud"
}

variable "ssh_username" {
  type    = string
  default = "ubuntu"
}

variable "disk_name" {
  type    = string
  default = "packer-vm-disk-custom"
}

variable "network" {
  type    = string
  default = "default"
}

variable "subnetwork" {
  type    = string
  default = "default"
}

variable "tags" {
  type    = list(string)
  default = ["packer"]
}

variable "image_name" {
  type    = string
  default = "my-packer-image-{{timestamp}}"
}