mysql2_chef_gem 'default' do
  action :install
end

#define credentials
creds = {
  :username => 'root',
  :password => 'p@ssword',
  #localhost
  :host => '127.0.0.1'
}

mysql_service 'default' do
  port '3306'
  version '5.5'
  initial_root_password creds[:password]
  action [:create, :start]
end

#create a new database
mysql_database 'database' do
  connection creds
  action :create
end

#create a new db user with all perms
mysql_database_user 'group12' do
  connection creds
  password 'passw0rd'
  privileges [:all]
  action [:create, :grant]
end


# Cookbook:: setup_db
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
