# == Define: orawls::utils::oimconfig
#
# does all the Oracle Identity Management configuration
#
define weblogic::utils::oimconfig(
  $domain_name                = undef,
  $weblogic_password          = undef,
  $oim_home                   = undef,
  $server_config              = false,
  $oim_password               = undef,
  $remote_config              = false,
  $keystore_password          = undef,
  $design_config              = false,
  $oimserver_hostname         = undef,
  $oimserver_port             = 14000,
  $soaserver_name             = 'soa_server1',
  $oimserver_name             = 'oim_server1',
  $bi_enabled                 = false, # only when you got a BI cluster
  $bi_cluster_name            = undef,
  $repository_database_url    = undef, #jdbc:oracle:thin:@192.168.50.5:1521:XE
  $repository_prefix          = 'DEV',
  $repository_password        = 'Welcome01',
  $adminserver_name           = 'AdminServer',
  $adminserver_address        = 'localhost',
  $adminserver_port           = 7001,
  $nodemanager_port           = 5556,
  $weblogic_user              = 'weblogic',
  ) {
    # Must include domain_name
    unless $domain_name {
      fail('A domain is required for oim configuration.')
    }

    # Must include weblogic password
    unless $weblogic_password {
      fail('A weblogic password is needed to modify an oim configuration.')
    }

    ::orawls::utils::oimconfig { $name :
      domain_name             => undef,
      weblogic_password       => undef,
      version                 => $::weblogic::version,
      oim_home                => undef,
      server_config           => false,
      oim_password            => undef,
      remote_config           => false,
      keystore_password       => undef,
      design_config           => false,
      oimserver_hostname      => undef,
      oimserver_port          => 14000,
      soaserver_name          => 'soa_server1',
      oimserver_name          => 'oim_server1',
      bi_enabled              => false, # only when you got a BI cluster
      bi_cluster_name         => undef,
      repository_database_url => undef, #jdbc:oracle:thin:@192.168.50.5:1521:XE
      repository_prefix       => 'DEV',
      repository_password     => 'Welcome01',
      jdk_home_dir            => $::weblogic::jdk_home_dir, # /usr/java/jdk1.7.0_45
      weblogic_home_dir       => $::weblogic::weblogic_home_dir, # /opt/oracle/middleware11gR1/wlserver_103
      middleware_home_dir     => $::weblogic::middleware_home_dir, # /opt/oracle/middleware11gR1
      wls_domains_dir         => $::weblogic::wls_domains_dir,
      adminserver_name        => 'AdminServer',
      adminserver_address     => 'localhost',
      adminserver_port        => 7001,
      nodemanager_port        => 5556,
      weblogic_user           => 'weblogic',
      os_user                 => $::weblogic::os_user, # oracle
      os_group                => $::weblogic::os_group, # dba
      download_dir            => $::weblogic::download_dir, # /data/install
      log_output              => $::weblogic::log_output, # true|false
    }
  }
