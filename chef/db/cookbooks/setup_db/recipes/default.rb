mysql2_chef_gem 'default' do
  action :install
end

#define credentials
connection_params = {
  :username => 'root',
  :password => 'p@ssword',
  #localhost
  :host => '127.0.0.1'
}

mysql_service 'default' do
  port '3306'
  version '5.5'
  initial_root_password connection_params[:password]
  action [:create, :start]
end

#create a new database
mysql_database 'database' do
  connection connection_params
  action :create
end

#create a new db user with all perms
mysql_database_user 'group12' do
  connection connection_params
  password 'passw0rd'
  privileges [:all]
  action [:create, :grant]
end

mysql_database 'database' do
  connection mysql_connection_info
  sql 'create table ice_cream (id int, flavor varchar(255), temperature int);'
  action :query
end


# Cookbook:: setup_db
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
