data "aws_ami" "ami_number" {

  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023*-kernel-*-x86_64"]
  }
}

data "vault_generic_secret" "demo" {
  path = "kv/instance_size"
}

data "vault_generic_secret" "vaultkeys" {
  path = "kv/keys_access"
}