locals {
  timestamped_name = "${var.ami_name_prefix}-${timestamp()}"
}

source "amazon-ebs" "lamp" {
  region                  = var.region
  source_ami              = var.source_ami
  instance_type           = var.instance_type
  ssh_username            = var.ssh_username
  ami_name                = local.timestamped_name
  ami_description         = "LAMP stack image built with Packer at ${timestamp()}"
  ami_virtualization_type = "hvm"
  ami_block_device_mappings = [{
    device_name           = "/dev/xvda"
    volume_size           = 20
    delete_on_termination = true
    volume_type           = "gp2"
  }]
  tags = {
    Name        = local.timestamped_name
    Environment = "production"
    Owner       = "DevOps"
    CreatedBy   = "Packer"
  }
}

build {
  name    = "lamp-ami-build"
  sources = ["source.amazon-ebs.lamp"]

  provisioner "shell" {
    script = "scripts/install_lamp.sh"
  }

  provisioner "shell" {
    inline = [
      "echo 'Verifying Apache and MySQL services...'",
      "sudo systemctl status httpd || exit 1",
      "sudo systemctl status mysqld || exit 1"
    ]
  }

  provisioner "shell" {
    script = "scripts/cleanup.sh"
  }

  post-processor "manifest" {
    output = "manifest.json"
  }
}
