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

## For the secure versions

These require some additional steps, the first time you run the containers. For security purposes a random password will be generated and printed to STDOUT, and then the
root user will be set unusable until the password is changed. Steps to get it working:

* docker logs mysql 2>/dev/null | grep "GENERATED ROOT PASSWORD"
The password will be printed out. Copy it (or write it down!).
* docker exec -it mysql bash
You will be put into the container. Then run:
* /usr/bin/mysql_secure_installation
This will ask you for your password, enter the one you saved earlier. It will then guide you through a series of steps to secure your mysql instance, including changing your password.
This new password is the one you will use to log into your root account on this container, and any following container, assuming you dont delete the persistent directory.
