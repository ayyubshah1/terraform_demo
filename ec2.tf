resource "aws_instance" "new_instance" {
  ami             = data.aws_ami.ami_number.id
  instance_type   = var.instance_size_map["dev"]
  security_groups = ["allow_tls"]
  count           = var.is_production == "yes" ? 3 : 1
  tags = {
    Name = "instance_${count.index}"
  }

  key_name = "newssh_key_pair"
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = data.vault_generic_secret.vaultkeys.data["pem_key"]
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum upgrade -y",
      "sudo yum install nginx -y",
      "echo Hello world >> newfile.txt",
      "sudo systemctl start nginx"
    ]

  }
}