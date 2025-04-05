packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  region        = var.region
  source_ami    = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  ssh_username  = "ubuntu"
  ami_name      = "packer-ubuntu-{{timestamp}}"
}

build {
  sources = ["source.amazon-ebs.ubuntu"]

  provisioner "shell" {
    script = "scripts/install_nginx.sh"
  }

  provisioner "shell" {
    inline = [
      "echo '<h1>Hello from Packer!</h1>' | sudo tee /var/www/html/index.html"
    ]
  }
}
