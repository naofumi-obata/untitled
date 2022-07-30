terraform {
  required_version = "1.2.6"

  backend "s3" {
    bucket  = "naofumi-untitled-bucket"
    key     = "terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "untitled"
  }
}

provider "aws" {
  region  = "ap-northeast-1"
}
