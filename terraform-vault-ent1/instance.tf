resource "aws_instance" "test-instance" {
  ami	= var.AMIS
  instance_type="t2.micro"
  key_name="mykey"

  provisioner "remote-exec" {
    inline = [
      "wget -c https://releases.hashicorp.com/vault/1.7.0-rc2+ent/vault_1.7.0-rc2+ent_linux_amd64.zip",
      "unzip vault_1.7.0-rc2+ent_linux_amd64.zip",
      "sudo mv vault /usr/local/bin"
    ]
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.path_to_private_key)
    host        = aws_instance.test-instance.public_ip
  }

tags = {
  name	= "Vault Primary Cluster"
  }
}

output "public_ip" {
  value = aws_instance.test-instance.public_ip
}

