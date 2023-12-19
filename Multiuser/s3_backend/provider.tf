terraform {
  required_version = "> 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }
  backend "s3" {
    bucket         = "myterraformbucketforbackend"
    key            = "terraformbackends/multiuser"
    dynamodb_table = "terraformbackend"
    region         = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}