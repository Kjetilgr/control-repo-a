class profile::mysql::server {

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
    grant    => ['SELECT', 'UPDATE'],
  }

  mysql_user { 'testuser@localhost':
    ensure                   => 'present',
    max_connections_per_hour => '60',
    max_queries_per_hour     => '120',
    max_updates_per_hour     => '120',
    max_user_connections     => '10',
  }

}

