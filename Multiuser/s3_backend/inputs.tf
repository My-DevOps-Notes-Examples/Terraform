variable "vpc_cidr" {
  type    = string
  default = "192.168.0.0/16"
}

variable "subnet_dev" {
  type    = string
  default = "192.168.0.0/24"
}