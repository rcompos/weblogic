# == Define: orawls::fmw
#
# installs FMW software like ADF, FORMS, OIM, WC, WCC, OSB, SOA Suite, B2B, MFT
#
##
define weblogic::fmw(
  $version                = undef,
  $oracle_home_dir        = undef,                             # /opt/oracle/middleware/Oracle_SOA
  $fmw_product            = undef,                             # adf|soa|soaqs|osb|wcc|wc|oim|oam|web|webgate|oud|mft|b2b|forms
  $fmw_file1              = undef,
  $fmw_file2              = undef,
  $fmw_file3              = undef,
  $fmw_file4              = undef,
  $download_dir           = $::weblogic::download_dir,         # /data/install
  $source                 = $::weblogic::source,
  $remote_file            = $::weblogic::remote_file,
  $bpm                    = false,
  $healthcare             = false,
  $ohs_mode               = 'collocated',
  $oracle_inventory_dir   = undef,
  $os_user                = $::weblogic::os_user,              # oracle
  $os_group               = $::weblogic::os_group,             # dba
  $oracle_instance_dir    = undef,
  $oracle_instance_name   = undef,
  $oracle_domain_location = undef,
  $oracle_domain_name     = undef,
) {
  # Must include weblogic password
  unless $version {
    fail('A version is required to install a fusion platform.')
  }


  ::orawls::fmw { $name:
    version                => $version,        # 1036|1111|1211|1212|1213|1221
    weblogic_home_dir      => $::weblogic::weblogic_home_dir,    # /opt/oracle/middleware11gR1/wlserver_103
    middleware_home_dir    => $::weblogic::middleware_home_dir,  # /opt/oracle/middleware11gR1
    oracle_base_home_dir   => $::weblogic::oracle_base_home_dir, # /opt/oracle
    oracle_home_dir        => $oracle_home_dir,                             # /opt/oracle/middleware/Oracle_SOA
    jdk_home_dir           => $::weblogic::jdk_home_dir,         # /usr/java/jdk1.7.0_45
    fmw_product            => $fmw_product,                             # adf|soa|soaqs|osb|wcc|wc|oim|oam|web|webgate|oud|mft|b2b|forms
    fmw_file1              => $fmw_file1,
    fmw_file2              => $fmw_file2,
    fmw_file3              => $fmw_file3,
    fmw_file4              => $fmw_file4,
    bpm                    => $bpm,
    healthcare             => $healthcare,
    os_user                => $os_user,              # oracle
    os_group               => $os_group,             # dba
    download_dir           => $download_dir,         # /data/install
    source                 => $source,        # puppet:///modules/orawls/ | /mnt | /vagrant
    remote_file            => $remote_file,                              # true|false
    log_output             => $::weblogic::log_output,                             # true|false
    temp_directory         => $::weblogic::temp_directory,      # /tmp directory
    ohs_mode               => $ohs_mode,
    oracle_inventory_dir   => $oracle_inventory_dir,
    oracle_instance_dir    => $oracle_instance_dir,
    oracle_instance_name   => $oracle_instance_name,
    oracle_domain_location => $oracle_domain_location,
    oracle_domain_name     => $oracle_domain_name,
  }
}
