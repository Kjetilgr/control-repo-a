
#install mysql and activate the service
execute  'yes | sudo yum install mysql' do	
end

execute  'yes | sudo yum install mysql-server' do
end

#execute 'sudo mysqld service start' do
#end

#enter db

execute 'mysql -u root; create database new_db' do
end

#create new db

execute 'create database new_db' do
end

