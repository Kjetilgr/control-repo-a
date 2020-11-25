
mysql_service 'mysqldefault' do
  #set port
  port '3306'
  version '5.5'
  #change this obviously
  initial_root_password 'password'
  #create and start the mysql service
  action [:create, :start]
end

execute ''
