terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "app" {
  name = "my-cicd-app:local"
}

resource "docker_container" "app" {
  image = docker_image.app.image_id
  name  = "cicd-container"

  ports {
    internal = 80
    external = 9090
  }
}
