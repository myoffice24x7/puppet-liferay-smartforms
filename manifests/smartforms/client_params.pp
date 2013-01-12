# myoffice/smartforms/client_params.pp

class myoffice::smartforms::client_params {

  $java_ver = '1.6.0_38'

  $db_name  = 'liferay'
  $db_user  = 'liferay'
  $db_pass  = 'liferay_p@ssw0rd'

  $web_user = 'liferay'

  $lr_dl    = 'http://downloads.sourceforge.net/project/lportal/Liferay%20Portal/6.1.1%20GA2/liferay-portal-tomcat-6.1.1-ce-ga2-20120731132656558.zip?r=\&ts=1357953553\&use_mirror=waix'
  $lr_root  = '/home/liferay/liferay-portal-6.1.1-ce-ga2'

}
