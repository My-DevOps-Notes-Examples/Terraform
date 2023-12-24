output "apache_server_url" {
  value = format("http://%s", aws_instance.apache_server.public_ip)
}