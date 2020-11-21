This is the control repo used automatically by [IaC-Heat-A](https://gitlab.com/erikhje/iac-heat-a) on deployment.

# Terraform

To start a database in docker with terraform:

1. Download terraform from [their website](https://www.terraform.io/downloads.html). Then unzip it and copy it to some folder in you PATH.

2. Use any of the terraform/.tf files you wish to issue the following commands:
* terraform init
This gets the docker provider setup for you to use with terraform.
* terraform plan
Terraform outputs a plan describing which actions it will take in order to create the infrastructure specified.
* terraform apply
Terraform will start applying the desired state, creating the docker container(s).

