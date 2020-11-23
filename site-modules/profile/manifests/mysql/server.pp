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
    sql      => '/tmp/table.sql',
    require  => File['/tmp/table.sql'],
  }

}

