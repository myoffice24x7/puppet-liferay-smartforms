# myoffice/smartforms/client_portlet.pp

class myoffice::smartforms::client_portlet(
  $portlet  = $myoffice::smartforms::client_params::portlet,
  $tc_root  = $myoffice::smartforms::client_params::tc_root,
  $web_user = $myoffice::smartforms::client_params::web_user,
  $lr_root  = $myoffice::smartforms::client_params::lr_root,
  $licence  = $myoffice::smartforms::client_params::licence,
) inherits myoffice::smartforms::client_params {

  exec { 'wget-portlet':
    command => "/usr/bin/wget --output-document=/${lr_root}/deploy/smartform-runtime-portlet.war \"${portlet}\"",
    creates => "${lr_root}/deploy/smartform-runtime-portlet.war",
    group   => "${web_user}",
    user    => "${web_user}",
    timeout => '0',
    require => Package['wget'],
  }

  exec { 'wget-licence':
    command => "/usr/bin/wget --output-document=${lr_root}/smartforms-licence.xml \"http://downloads.smartforms.myoffice24x7.com/default-licenses/default.${licence}.xml\"",
    creates => "${lr_root}/smartforms-licence.xml",
    group   => "${web_user}",
    user    => "${web_user}",
    require => Package['wget'],
  }

  file { "${tc_root}/bin/setenv.sh":
    owner   => "${web_user}",
    group   => "${web_user}",
    content => template('myoffice/setenv.sh.erb'),
  }
}
