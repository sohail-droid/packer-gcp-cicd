packer {
  required_plugins {
    googlecompute = {
      source  = "github.com/hashicorp/googlecompute"
      version = ">= 1.0.0"
    }
  }
}

source "googlecompute" "ubuntu" {
  project_id              = var.project_id
  instance_name           = var.instance_name
  zone                    = var.zone
  machine_type            = var.machine_type
  source_image_family     = var.source_image_family
  source_image_project_id = var.source_image_project_id
  ssh_username            = var.ssh_username
  disk_name               = var.disk_name
  network                 = var.network
  subnetwork              = var.subnetwork
  tags                    = var.tags
  image_name              = var.image_name
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
