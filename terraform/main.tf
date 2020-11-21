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
  name  = "db2"	
  image = "mysql:latest"	
  restart = "always"	
  env = ["MYSQL_ROOT_PASSWORD=123"]	
}
