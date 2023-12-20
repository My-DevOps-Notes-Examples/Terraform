resource "local_file" "multifiles" {
  for_each = toset(var.filenames)
  content  = "solving Count problem using For_each"
  filename = each.key
}