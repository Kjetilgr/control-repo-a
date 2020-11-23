class profile::mysql {

  class { '::mysql::server':
    root_password           => 'strongpassword',
    remove_default_accounts => true,
    restart                 => true,
    override_options        => { 'mysqld' => { 'max_connections' => '1024' } }
  }

  mysql::db { 'testdb':
    user     => 'admin',
    password => 'secret',
    host     => 'localhost',
    grant    => ['SELECT', 'UPDATE']
    sql      => '/tmp/table.sql'
    require  => File['/tmp/table.sql']
  }

  file { "/tmp/table.sql":
    ensure => present,
    source => "puppet:///site-modules/profile/manifests/mysql/files/table.sql"
  }

 mysql_user { 'testuser@localhost':
   ensure                   => 'present',
   max_connections_per_hour => '60',
   max_queries_per_hour     => '120',
   max_update_per_hour      => '120',
   max_user_connections     => '10',
 }

 mysql_grant { 'testuser@localhost/testdb.table':
   ensure     => 'present',
   options    => ['GRANT'],
   privileges => ['ALL'],
   table      => 'testdb.table',
   user       => 'testuser@localhost',
 }
  
}

