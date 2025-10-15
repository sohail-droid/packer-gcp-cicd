packer {
  required_plugins {
    googlecompute = {
      source  = "github.com/hashicorp/googlecompute"
      version = ">= 1.0.0"
    }
  }
}

variable "project_id" {
  default = "training-2024-batch"
}

source "googlecompute" "ubuntu" {
  project_id              = var.project_id
  instance_name           = "packer-test-vm"
  zone                    = "us-central1-a"
  machine_type            = "e2-medium"

  source_image_family     = "ubuntu-2204-lts"
  # source_image_project_id = ["ubuntu-os-cloud"]   # list of string
  ssh_username            = "ubuntu"

  disk_name               = "packer-vm-disk-custom"
  network                 = "default"
  subnetwork              = "default"
  tags                    = ["packer"]          # list of strings
  
  image_name              =  "my-packer-image-{{timestamp}}"
}

build {
  name    = "ubuntu-gcp-test"
  sources = ["source.googlecompute.ubuntu"]

  provisioner "shell" {
    inline = [
      "echo Hello from inside GCP VM",
      "sudo apt-get update -y",
"sudo apt install nginx -y",
"sudo systemctl enable nginx"
    ]
  }
}
