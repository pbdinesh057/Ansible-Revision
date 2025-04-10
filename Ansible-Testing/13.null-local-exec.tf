resource "null_resource" "webservers" {
  provisioner "local-exec" {
    command = <<EOH
      sleep 10
      ANSIBLE_HOST_KEY_CHECKING=False ansible -i invfile pvt -m ping
      sleep 10
      ANSIBLE_HOST_KEY_CHECKING=False ansible -i invfile pub -m ping
      sleep 10
      ANSIBLE_HOST_KEY_CHECKING=False ansible all -i invfile -m ping
    EOH
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }
  depends_on = [local_file.ansible-inventory-file]
}
