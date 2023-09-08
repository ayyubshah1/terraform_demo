variable "cid_block_for_ingress" {

  default = "0.0.0.0/0"
}

variable "instance_size" {

  default = "t2.micro"
}

variable "instance_size_map" {

  default = {
    dev  = "t2.micro",
    test = "t3.micro",
    live = "t3.large"
  }
}

variable "instance_size_list" {

  default = ["t2.micro", "t3.micro", "t3.large"]
}


variable "is_production" {
  type        = string
  description = "Is production? (yes/no)"
}

variable "port_list" {
  type        = list(number)
  description = "list of ports for ingress values"
  default     = [80, 443, 22]
}