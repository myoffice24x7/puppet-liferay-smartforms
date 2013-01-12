# myoffice/smartforms/client_user.pp

class myoffice::smartforms::client_user(
  $user = $myoffice::smartforms::client_params::web_user,
) inherits myoffice::smartforms::client_params {

  user { "${user}":
    ensure     => present,
    comment    => 'Liferay Portal',
    shell      => '/bin/bash',
    home       => "/home/${user}",
    managehome => true,
  }
}
