resource "null_resource" "get_google" {

  provisioner "local-exec" {
    command = "curl https://google.com"
  }
}

resource "aws_eip" "null_demo" {
  domain     = "vpc"
  depends_on = [null_resource.get_google]
}