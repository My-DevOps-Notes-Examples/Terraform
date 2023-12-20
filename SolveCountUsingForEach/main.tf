resource "local_file" "multifiles" {
  count    = length(var.filenames)
  content  = "solving Count problem using For_each"
  filename = var.filenames[count.index]
}