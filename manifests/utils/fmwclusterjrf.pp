# == Define: orawls::utils::fmwclusterjrf
#
# transform domain to a ADF cluster
##
define weblogic::utils::fmwclusterjrf (
  $domain_name                = undef,
  $weblogic_password          = undef,
  $adminserver_name           = 'AdminServer',
  $adminserver_address        = 'localhost',
  $adminserver_port           = 7001,
  $nodemanager_port           = 5556,
  $jrf_target_name            = undef,
  $opss_datasource_name       = undef,
  $weblogic_user              = 'weblogic',
  )
  {
    # Must include domain_name
    unless $domain_name {
      fail('The domain must be passed if for fmw jrf.')
    }

    # Must include weblogic password
    unless $weblogic_password {
      fail('A weblogic password is needed to modify fmw jrf.')
    }

    ::orawls::utils::fmwclusterjrf { $name:
      domain_name          => undef,
      weblogic_password    => undef,
      version              => $::orawls::weblogic::version,  # 1036|1111|1211|1212|1213|1221
      weblogic_home_dir    => $::orawls::weblogic::weblogic_home_dir, # /opt/oracle/middleware11gR1/wlserver_103
      middleware_home_dir  => $::orawls::weblogic::middleware_home_dir, # /opt/oracle/middleware11gR1
      jdk_home_dir         => $::orawls::weblogic::jdk_home_dir, # /usr/java/jdk1.7.0_45
      wls_domains_dir      => $::orawls::weblogic::wls_domains_dir,
      adminserver_name     => 'AdminServer',
      adminserver_address  => 'localhost',
      adminserver_port     => 7001,
      nodemanager_port     => 5556,
      jrf_target_name      => undef,
      opss_datasource_name => undef,
      weblogic_user        => 'weblogic',
      os_user              => $::orawls::weblogic::os_user, # oracle
      os_group             => $::orawls::weblogic::os_group, # dba
      download_dir         => $::orawls::weblogic::download_dir, # /data/install
      log_output           => $::orawls::weblogic::log_output, # true|false
    }
  }
