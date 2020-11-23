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
  env     = ["MYSQL_RANDOM_ROOT_PASSWORD=true", "MYSQL_ONETIME_PASSWORD=true"] // This will only have an affect the first time you launch this. Any subsequent launches the password will stay as set. See README.
  mounts {
    target = "/var/lib/mysql"
    source = "/your/persistent/path" // Change this
    type   = "bind"
  }
}
