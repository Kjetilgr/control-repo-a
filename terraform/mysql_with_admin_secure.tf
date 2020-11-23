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
  image   = "mysql:5.6" //Persistence bug in more recent versions	
  restart = "always"
  env     = ["MYSQL_RANDOM_ROOT_PASSWORD=true", "MYSQL_ONETIME_PASSWORD=true"] // This will only have an affect the first time you launch this. Any subsequent launches the password will stay as set. See README.
  mounts {
    target = "/var/lib/mysql"
    source = "/your/persisten/path" // Change this
    type   = "bind"
  }
}

resource "docker_container" "phpmyadmin" {
  name    = "phpmyadmin"
  image   = "phpmyadmin:latest"
  restart = "always"
  links   = ["mysql:db"]
  ports {
    internal = 80
    external = 8080
  }

  depends_on = [docker_container.db]
}
