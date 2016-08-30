# == Define: orawls::copydomain
#
#   copydomain to an other nodes
##
define weblogic::copydomain (
  $domain_name                = undef,
  $weblogic_password          = undef,
  $adminserver_address        = undef,
  $use_ssh                    = true,
  $domain_pack_dir            = undef,
  $adminserver_port           = 7001,
  $userConfigFile             = undef,
  $userKeyFile                = undef,
  $weblogic_user              = 'weblogic',
  $log_dir                    = undef, # /data/logs
  $server_start_mode          = 'dev', # dev/prod
  )
  {
    # Must include domain_name
    unless $domain_name {
      fail('The domain to copy must be passed in.')
    }

    # Must include weblogic password
    unless $weblogic_password {
      fail('A weblogic password is needed to copy a domain.')
    }

    ::orawls::copydomain { $name:
      domain_name         => undef,
      weblogic_password   => undef,
      adminserver_address => undef,
      version             => $::weblogic::version,  # 1036|1111|1211|1212
      middleware_home_dir => $::weblogic::middleware_home_dir, # /opt/oracle/middleware11gR1
      weblogic_home_dir   => $::weblogic::weblogic_home_dir, # /opt/oracle/middleware11gR1/wlserver_103
      jdk_home_dir        => $::weblogic::jdk_home_dir, # /usr/java/jdk1.7.0_45
      wls_domains_dir     => $::weblogic::wls_domains_dir,
      wls_apps_dir        => $::weblogic::wls_apps_dir,
      use_ssh             => true,
      domain_pack_dir     => undef,
      adminserver_port    => 7001,
      userConfigFile      => undef,
      userKeyFile         => undef,
      weblogic_user       => 'weblogic',
      os_user             => $::weblogic::os_user, # oracle
      os_group            => $::weblogic::os_group, # dba
      download_dir        => $::weblogic::download_dir, # /data/install
      log_dir             => undef, # /data/logs
      log_output          => $::weblogic::log_output, # true|false
      server_start_mode   => 'dev', # dev/prod
    }
  }
