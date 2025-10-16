packer {
  required_plugins {
    googlecompute = {
      source  = "github.com/hashicorp/googlecompute"
      version = "~> 1.1"
    }
  }
}

source "googlecompute" "ubuntu" {
  project_id               = var.project_id
  zone                     = var.zone
  machine_type             = var.machine_type
  source_image_family      = var.source_image_family
  source_image_project_id  = var.source_image_project_id  # Back to singular
  ssh_username             = var.ssh_username
  image_name               = var.image_name
}

build {
  name    = "ubuntu-gcp-image"
  sources = ["source.googlecompute.ubuntu"]

  provisioner "shell" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install nginx -y",
      "sudo systemctl enable nginx"
    ]
  }
}