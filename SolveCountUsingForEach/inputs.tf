variable "filenames" {
  type = map(object({
    name    = string
    content = string
  }))
  default = {
    "file1" = {
      name    = "1.txt"
      content = "hello"
    }
    "file2" = {
      name    = "2.txt"
      content = "terraform"
    }
  }
}