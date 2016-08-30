# == Define: orawls::domain
#
# setup a new weblogic domain
##
define weblogic::domain (
  $weblogic_password                     = undef,
  $domain_template                       = 'standard', # adf|adf_restricted|osb|osb_soa_bpm|osb_soa|soa|soa_bpm|bam|wc|wc_wcc_bpm|oud|ohs_standalone
  $bam_enabled                           = true,  #only for SOA Suite
  $b2b_enabled                           = false, #only for SOA Suite 12.1.3 with b2b
  $ess_enabled                           = false, #only for SOA Suite 12.1.3
  $owsm_enabled                          = false, #only for OSB domain_template on 10.3.6
  $development_mode                      = true,
  $adminserver_name                      = 'AdminServer',
  $adminserver_machine_name              = 'LocalMachine',
  $adminserver_address                   = undef,
  $adminserver_port                      = 7001,
  $adminserver_ssl_port                  = undef,
  $adminserver_listen_on_all_interfaces  = false,  # for docker etc
  $java_arguments                        = {},         # java_arguments = { "ADM" => "...", "OSB" => "...", "SOA" => "...", "BAM" => "..."}
  $nodemanager_address                   = undef,
  $nodemanager_port                      = 5556,
  $nodemanager_secure_listener           = true,
  $weblogic_user                         = 'weblogic',
  $nodemanager_username                  = undef, # When not specified, it'll use the weblogic_user
  $nodemanager_password                  = undef, # When not specified, it'll use the weblogic_password
  $domain_password                       = undef, # When not specified, it'll use the weblogic_password
  $jsse_enabled                          = false,
  $webtier_enabled                       = false,
  $log_dir                               = undef, # /data/logs
  $repository_database_url               = undef, #jdbc:oracle:thin:@192.168.50.5:1521:XE
  $rcu_database_url                      = undef,                                      #localhost:1521:XE"
  $repository_prefix                     = 'DEV',
  $repository_password                   = 'Welcome01',
  $repository_sys_user                   = 'sys',
  $repository_sys_password               = undef,
  $custom_trust                          = false,
  $trust_keystore_file                   = undef,
  $trust_keystore_passphrase             = undef,
  $custom_identity                       = false,
  $custom_identity_keystore_filename     = undef,
  $custom_identity_keystore_passphrase   = undef,
  $custom_identity_alias                 = undef,
  $custom_identity_privatekey_passphrase = undef,
  $create_rcu                            = true,
  $ohs_standalone_listen_address         = undef,
  $ohs_standalone_listen_port            = undef,
  $ohs_standalone_ssl_listen_port        = undef,
)
{
  # Must include weblogic password
  unless $weblogic_password {
    fail('A weblogic password is needed to create a domain.')
  }

  ::orawls::domain { $name:
    domain_name                           => $name,
    weblogic_password                     => $weblogic_password,
    version                               => $::weblogic::version,  # 1036|1111|1211|1212|1213|1221
    weblogic_home_dir                     => $::weblogic::weblogic_home_dir, # /opt/oracle/middleware11gR1/wlserver_103
    middleware_home_dir                   => $::weblogic::middleware_home_dir, # /opt/oracle/middleware11gR1
    jdk_home_dir                          => $::weblogic::jdk_home_dir, # /usr/java/jdk1.7.0_45
    wls_domains_dir                       => $::weblogic::wls_domains_dir,
    wls_apps_dir                          => $::weblogic::wls_apps_dir,
    domain_template                       => $domain_template, # adf|adf_restricted|osb|osb_soa_bpm|osb_soa|soa|soa_bpm|bam|wc|wc_wcc_bpm|oud|ohs_standalone
    bam_enabled                           => $bam_enabled,  #only for SOA Suite
    b2b_enabled                           => $b2b_enabled, #only for SOA Suite 12.1.3 with b2b
    ess_enabled                           => $ess_enabled, #only for SOA Suite 12.1.3
    owsm_enabled                          => $owsm_enabled, #only for OSB domain_template on 10.3.6
    development_mode                      => $development_mode,
    adminserver_name                      => $adminserver_name,
    adminserver_machine_name              => $adminserver_machine_name,
    adminserver_address                   => $adminserver_address,
    adminserver_port                      => $adminserver_port,
    adminserver_ssl_port                  => $adminserver_ssl_port,
    adminserver_listen_on_all_interfaces  => $adminserver_listen_on_all_interfaces,  # for docker etc
    java_arguments                        => $java_arguments,         # java_arguments => { "ADM" =>> "...", "OSB" =>> "...", "SOA" =>> "...", "BAM" =>> "..."}
    nodemanager_address                   => $nodemanager_address,
    nodemanager_port                      => $nodemanager_port,
    nodemanager_secure_listener           => $nodemanager_secure_listener,
    weblogic_user                         => $weblogic_user,
    nodemanager_username                  => $nodemanager_username, # When not specified, it'll use the weblogic_user
    nodemanager_password                  => $nodemanager_password, # When not specified, it'll use the weblogic_password
    domain_password                       => $domain_password, # When not specified, it'll use the weblogic_password
    jsse_enabled                          => $jsse_enabled,
    webtier_enabled                       => $webtier_enabled,
    os_user                               => $::weblogic::os_user, # oracle
    os_group                              => $::weblogic::os_group, # dba
    download_dir                          => $::weblogic::download_dir, # /data/install
    log_dir                               => $log_dir, # /data/logs
    log_output                            => $::weblogic::log_output, # true|false
    repository_database_url               => $repository_database_url, #jdbc:oracle:thin:@192.168.50.5:1521:XE
    rcu_database_url                      => $rcu_database_url,                                      #localhost:1521:XE"
    repository_prefix                     => $repository_prefix,
    repository_password                   => $repository_password,
    repository_sys_user                   => $repository_sys_user,
    repository_sys_password               => $repository_sys_password,
    custom_trust                          => $custom_trust,
    trust_keystore_file                   => $trust_keystore_file,
    trust_keystore_passphrase             => $trust_keystore_passphrase,
    custom_identity                       => $custom_identity,
    custom_identity_keystore_filename     => $custom_identity_keystore_filename,
    custom_identity_keystore_passphrase   => $custom_identity_keystore_passphrase,
    custom_identity_alias                 => $custom_identity_alias,
    custom_identity_privatekey_passphrase => $custom_identity_privatekey_passphrase,
    create_rcu                            => $create_rcu,
    ohs_standalone_listen_address         => $ohs_standalone_listen_address,
    ohs_standalone_listen_port            => $ohs_standalone_listen_port,
    ohs_standalone_ssl_listen_port        => $ohs_standalone_ssl_listen_port,
  }

  ::weblogic::control { $name:
    domain_name                 => $name,
    weblogic_password           => $weblogic_password,
    server_type                 => 'admin',  # admin|managed|ohs_standalone
    target                      => 'Server', # Server|Cluster
    server                      => 'AdminServer',
    adminserver_address         => $adminserver_address,
    adminserver_port            => $adminserver_port,
    nodemanager_secure_listener => $nodemanager_secure_listener ,
    nodemanager_port            => $nodemanager_port,
    action                      => 'start', # start|stop
    weblogic_user               => $weblogic_user,
    jsse_enabled                => $jsse_enabled,
    custom_trust                => $custom_trust,
    trust_keystore_file         => $trust_keystore_file,
    trust_keystore_passphrase   => $trust_keystore_passphrase,
    require                     => ::Orautils::Nodemanagerautostart[$name],
  }

  ::weblogic::nodemanager { $name:
    domain_name                           => $name,
    nodemanager_port                      => $nodemanager_port,
    nodemanager_address                   => $nodemanager_address,
    nodemanager_secure_listener           => $nodemanager_secure_listener,
    jsse_enabled                          => $jsse_enabled,
    custom_trust                          => $custom_trust,
    trust_keystore_file                   => $trust_keystore_file,
    trust_keystore_passphrase             => $trust_keystore_passphrase,
    custom_identity                       => $custom_identity,
    custom_identity_keystore_filename     => $custom_identity_keystore_filename,
    custom_identity_keystore_passphrase   => $custom_identity_keystore_passphrase,
    custom_identity_alias                 => $custom_identity_alias,
    custom_identity_privatekey_passphrase => $custom_identity_privatekey_passphrase,
    log_dir                               => $log_dir, # /data/logs
    log_file                              => 'nodemanager.log',
    sleep                                 => 20, # default sleep time
    properties                            => {},
    ohs_standalone                        => false,
    require                               => ::Orawls::Domain[$name],
  }

  ::orautils::nodemanagerautostart{ $name:
    version                   => $::weblogic::version,
    wl_home                   => $::weblogic::weblogic_home_dir,
    user                      => $::weblogic::os_user,
    jsse_enabled              => $jsse_enabled,
    custom_trust              => $custom_trust,
    trust_keystore_file       => $trust_keystore_file,
    trust_keystore_passphrase => $trust_keystore_passphrase,
    require                   => ::Weblogic::Nodemanager[$name],
  }
}
