resource "local_file" "multifiles" {
  for_each = var.filenames
  content  = each.value.content
  filename = each.value.name
}