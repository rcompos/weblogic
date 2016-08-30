# == Define: orawls::utils::fmwcluster
#
# transform domain to a soa,osb,bam cluster
##
define weblogic::utils::fmwcluster (
  $domain_name                = undef,
  $weblogic_password          = undef,
  $ofm_version                = 1117,   # 1116|1117
  $adminserver_name           = 'AdminServer',
  $adminserver_address        = 'localhost',
  $adminserver_port           = 7001,
  $nodemanager_port           = 5556,
  $soa_cluster_name           = undef,
  $bam_cluster_name           = undef,
  $osb_cluster_name           = undef,
  $oam_cluster_name           = undef,
  $oim_cluster_name           = undef,
  $ess_cluster_name           = undef,
  $bi_cluster_name            = undef,
  $bpm_enabled                = false, # true|false
  $bam_enabled                = false, # true|false
  $osb_enabled                = false, # true|false
  $soa_enabled                = false, # true|false
  $oam_enabled                = false, # true|false
  $oim_enabled                = false, # true|false
  $b2b_enabled                = false, # true|false
  $ess_enabled                = false, # true|false
  $bi_enabled                 = false, # true|false
  $repository_prefix          = 'DEV',
  $weblogic_user              = 'weblogic',
  $retain_file_store          = false, # true|false
  $jsse_enabled               = false,
  $custom_trust               = false,
  $trust_keystore_file        = undef,
  $trust_keystore_passphrase  = undef,
  )
  {
    # Must include domain_name
    unless $domain_name {
      fail('The domain to install the fmw on must be passed in.')
    }

    # Must include weblogic password
    unless $weblogic_password {
      fail('A weblogic password is needed to install fmw.')
    }

    ::orawls::utils::fmwcluster { $name:
      domain_name               => undef,
      weblogic_password         => undef,
      version                   => $::weblogic::version,  # 1036|1111|1211|1212|1213|1221
      ofm_version               => 1117,   # 1116|1117
      weblogic_home_dir         => $::weblogic::weblogic_home_dir, # /opt/oracle/middleware11gR1/wlserver_103
      middleware_home_dir       => $::weblogic::middleware_home_dir, # /opt/oracle/middleware11gR1
      jdk_home_dir              => $::weblogic::jdk_home_dir, # /usr/java/jdk1.7.0_45
      wls_domains_dir           => $::weblogic::wls_domains_dir,
      adminserver_name          => 'AdminServer',
      adminserver_address       => 'localhost',
      adminserver_port          => 7001,
      nodemanager_port          => 5556,
      soa_cluster_name          => undef,
      bam_cluster_name          => undef,
      osb_cluster_name          => undef,
      oam_cluster_name          => undef,
      oim_cluster_name          => undef,
      ess_cluster_name          => undef,
      bi_cluster_name           => undef,
      bpm_enabled               => false, # true|false
      bam_enabled               => false, # true|false
      osb_enabled               => false, # true|false
      soa_enabled               => false, # true|false
      oam_enabled               => false, # true|false
      oim_enabled               => false, # true|false
      b2b_enabled               => false, # true|false
      ess_enabled               => false, # true|false
      bi_enabled                => false, # true|false
      repository_prefix         => 'DEV',
      weblogic_user             => 'weblogic',
      os_user                   => $::weblogic::os_user, # oracle
      os_group                  => $::weblogic::os_group, # dba
      download_dir              => $::weblogic::download_dir, # /data/install
      log_output                => $::weblogic::log_output, # true|false
      retain_file_store         => false, # true|false
      jsse_enabled              => false,
      custom_trust              => false,
      trust_keystore_file       => undef,
      trust_keystore_passphrase => undef,
    }
  }
