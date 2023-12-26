output "private_subnets_ids" {
  value = data.aws_subnets.private.ids
}

output "public_subnets_ids" {
  value = data.aws_subnets.public.ids
}