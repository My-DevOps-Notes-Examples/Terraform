provider "aws" {
  region = "us-east-1"
  alias  = "default"
}

provider "aws" {
  region = "us-west-1"
  alias  = "second"
}