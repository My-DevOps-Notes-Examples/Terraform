variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_info" {
  type = object({
    vpc_cidr             = string
    vpc_name             = string
    subnet_names         = list(string)
    subnets_azs          = list(string)
    igw_name             = string
    private_subnets      = list(string)
    public_subnets       = list(string)
    apache_server_subnet = string
  })
  default = {
    vpc_cidr             = "192.168.0.0/16"
    vpc_name             = "appserver-vpc"
    subnet_names         = ["app1", "app2", "web1", "web2"]
    subnets_azs          = ["a", "b", "a", "b"]
    igw_name             = "appserver-igw"
    private_subnets      = ["app1", "app2"]
    public_subnets       = ["web1", "web2"]
    apache_server_subnet = "web1"
  }
}


variable "server_security_group" {
  type = object({
    name        = string
    description = string
    port_80     = number
    port_22     = number
    protocol    = string
  })
  default = {
    name        = "server-sg"
    description = "open 22 & 80"
    port_80     = 80
    port_22     = 22
    protocol    = "tcp"
  }
}

variable "rollout_version" {
  type    = string
  default = "0.0.0.0"
}