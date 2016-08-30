#
#
define weblogic::resourceadapter (
  $domain_name               = undef,
  $weblogic_password         = undef,
  $adapter_name              = undef,
  $adapter_path              = undef,
  $adapter_plan_dir          = undef,
  $adapter_plan              = undef,
  $adapter_entry             = undef,
  $adapter_entry_property    = undef,
  $adapter_entry_value       = undef,
  $adminserver_address       = 'localhost',
  $adminserver_port          = 7001,
  $userConfigFile            = undef,
  $userKeyFile               = undef,
  $weblogic_user             = 'weblogic',
  )
  {
    # Must include domain_name
    unless $domain_name {
      fail('A resource adapter must be associated with a domain.')
    }

    # Must include weblogic password
    unless $weblogic_password {
      fail('A weblogic password is needed to modify a resource adapter.')
    }

    ::orawls::resourceadapter { $name:
      domain_name            => undef,
      weblogic_password      => undef,
      middleware_home_dir    => $::weblogic::middleware_home_dir, # /opt/oracle/middleware11gR1
      weblogic_home_dir      => $::weblogic::weblogic_home_dir,
      jdk_home_dir           => $::weblogic::jdk_home_dir, # /usr/java/jdk1.7.0_45
      wls_domains_dir        => $::weblogic::wls_domains_dir,
      adapter_name           => undef,
      adapter_path           => undef,
      adapter_plan_dir       => undef,
      adapter_plan           => undef,
      adapter_entry          => undef,
      adapter_entry_property => undef,
      adapter_entry_value    => undef,
      adminserver_address    => 'localhost',
      adminserver_port       => 7001,
      userConfigFile         => undef,
      userKeyFile            => undef,
      weblogic_user          => 'weblogic',
      os_user                => $::weblogic::os_user, # oracle
      os_group               => $::weblogic::os_group, # dba
      download_dir           => $::weblogic::download_dir, # /data/install
      log_output             => $::weblogic::log_output, # true|false
    }
  }
