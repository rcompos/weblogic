# == Define: orawls::storeuserconfig
#
# generic storeuserconfig wlst script
#
define weblogic::storeuserconfig (
  $domain_name         = undef,
  $weblogic_password   = undef,
  $weblogic_home_dir   = $::orawls::weblogic::weblogic_home_dir, # /opt/oracle/middleware11gR1/
  $adminserver_address = 'localhost',
  $adminserver_port    = 7001,
  $user_config_dir     = undef,                                           #'/home/oracle',
  $weblogic_user       = 'weblogic',
  )
  {
    # Must include domain_name
    unless $domain_name {
      fail('A user config store must be associated with a domain.')
    }

    # Must include weblogic password
    unless $weblogic_password {
      fail('A weblogic password is needed to modify a user config store.')
    }

    ::orawls::storeuserconfig { $name:
      domain_name         => undef,
      weblogic_password   => undef,
      weblogic_home_dir   => $::weblogic::weblogic_home_dir, # /opt/oracle/middleware11gR1/wlserver_103
      jdk_home_dir        => $::weblogic::jdk_home_dir,      # /usr/java/jdk1.7.0_45
      adminserver_address => 'localhost',
      adminserver_port    => 7001,
      user_config_dir     => undef,                                           #'/home/oracle',
      weblogic_user       => 'weblogic',
      os_user             => $::weblogic::os_user, # oracle
      os_group            => $::weblogic::os_group, # dba
      download_dir        => $::weblogic::download_dir, # /data/install
      log_output          => $::weblogic::log_output,
    }
  }
