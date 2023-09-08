resource "aws_eip" "fixed_ip" {
  domain = "vpc"
  count  = var.is_production == "yes" ? 3 : 1
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.new_instance[count.index].id
  allocation_id = aws_eip.fixed_ip[count.index].id
  count         = var.is_production == "yes" ? 3 : 1

}