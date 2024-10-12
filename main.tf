
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}


locals {
  extra_tag = "extra_tag"
}


// usamos ciclo for para iterar la creacion de instancias

resource "aws_instance" "example" {

  for_each = var.service_names

  ami           = "ami-011899242bb902164"
  instance_type = "t2.micro"
  tags = {
    extra_tag = local.extra_tag
    Name = "EC2-${each.key}"
  }
}


resource "aws_cloudwatch_log_group" "ec2_log_group" {
  
  for_each = var.service_names

  tags = {
    Enviroment = "test"
    Service = each.key
  }
  // cuando se realizan cambios, primero se crea el recurso luego se borra el viejo
  // con esta instruccion se evitan interrupciones en el servicio
  lifecycle {
    create_before_destroy = true
  }

}