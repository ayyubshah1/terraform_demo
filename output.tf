output "private_ips" {
  value     = aws_instance.new_instance[*].private_ip
  sensitive = true

}
output "vault_secret_stuff" {
  value     = data.vault_generic_secret.demo.data["instanceSize_dev"]
  sensitive = true
}