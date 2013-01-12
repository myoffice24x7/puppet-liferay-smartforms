# myoffice/smartforms/client_db.pp

class myoffice::smartforms::client_db::install {
  class { 'percona':
    server          => true,
    percona_version => '5.5',
    manage_repo     => 'true',
  }
}

class myoffice::smartforms::client_db::configure {
  percona::database { "${db_name}":
    ensure => present,
  }
  percona::rights { "${db_user}@localhost/${db_name}":
    priv     => 'all',
    password => "${db_pass}"
  }
}

class myoffice::smartforms::client_db(
  $db_name = $myoffice::smartforms::client_params::db_name,
  $db_user = $myoffice::smartforms::client_params::db_user,
  $db_pass = $myoffice::smartforms::client_params::db_pass,
) inherits myoffice::smartforms::client_params {

  class { 'myoffice::smartforms::client_db::install': }
  class { 'myoffice::smartforms::client_db::configure': }
  Class['myoffice::smartforms::client_db::install'] -> Class['myoffice::smartforms::client_db::configure']

}
