terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.5.0"
    }
  }

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "aws-sundbox"

    workspaces {
      name = "tf-ecs-alb"
    }
  }
}
