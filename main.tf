terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.25.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "salutation" {
  name = "safa318/salutation:1.0"
}

resource "docker_container" "salutation" {
  image = docker_image.salutation.name
  name  = "salutation"
  ports {
    internal = 8888
    external = 9999
  }
}
