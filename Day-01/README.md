# 🚀 Packer Refresher Exercises

## 1. 🔧 Basic AMI Build
- Create a folder `ubuntu-ami`
- Add a Packer config to build a basic Ubuntu AMI with `nginx` installed
- Use `scripts/install_nginx.sh` to provision the package
- Run:
  ```bash
  packer init .
  packer validate .
  packer build .
  ```

## 2. 🧪 Add Variables
- Create `variables.pkr.hcl`:
  ```hcl
  variable "region" {
    type    = string
    default = "us-east-1"
  }
  ```
- Reference it in `main.pkr.hcl` like:
  ```hcl
  region = var.region
  ```
- Pass variables via a file: `ubuntu.pkrvars.hcl`
  ```hcl
  region = "us-west-2"
  ```

- Run:
  ```bash
  packer validate -var-file="ubuntu.pkrvars.hcl"
  packer build -var-file="ubuntu.pkrvars.hcl"
  ```

## 3. 🌍 Add Another Provisioner
- Add another shell provisioner that creates an `index.html`:
  ```hcl
  provisioner "shell" {
    inline = [
      "echo '<h1>Hello from Packer!</h1>' | sudo tee /var/www/html/index.html"
    ]
  }
  ```

## 4. 🧼 Format and Validate
- Run:
  ```bash
  packer fmt .
  packer validate .
  ```

## 5. 📦 Convert JSON to HCL (Optional)
- If you have old JSON templates, run:
  ```bash
  packer hcl2_upgrade -with-annotations template.json
  ```

## ✅ Bonus
- Try building AMI using `amazon-chroot` instead of `amazon-ebs`
- Try adding a post-processor block to compress artifacts (used more in docker builds)

---

### 📚 Resources
- [Packer Docs](https://developer.hashicorp.com/packer/docs)
- [Packer GitHub Examples](https://github.com/hashicorp/packer-examples)
