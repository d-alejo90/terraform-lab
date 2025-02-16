terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.87.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

locals { # asi podemos declarar variables locales solo en el scope de nuestro archivo
  lab_tag = "terraform lab"
}

resource "aws_instance" "terraform_lab_example_00" {
  ami           = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
  tags = {
    LabTag = local.lab_tag
  }
}
