terraform {
  required_providers {
    docker = {
      source = "terraform-providers/docker"
    }
  }
}

provider "docker" {}

# create db container	
resource "docker_container" "db" {
  name    = "mysql"
  image   = "mysql:5.6" //Persistence bug in more recent versions, have to use 5.6 (or different db provider)	
  restart = "always"
  env     = ["MYSQL_ROOT_PASSWORD=top-secret"] // This will only be set first time with persistence! Changing will have no effect unless using new mount. Insecure!
  mounts {
    target = "/var/lib/mysql"
    source = "/your/persistent/path" // Change this
    type   = "bind"
  }
}
