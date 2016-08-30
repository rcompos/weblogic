# == Define: orawls::utils::webtier
#
# Add a Webtier to the Enterprise manager
##
define weblogic::utils::webtier(
  $domain_name                = undef,
  $weblogic_password          = undef,
  $adminserver_address        = 'localhost',
  $adminserver_port           = 7001,
  $action_name                = 'create', #create|delete
  $webgate_configure          = false,
  $webgate_agentname          = undef,
  $webgate_hostidentifier     = undef,
  $oamadminserverhostname     = 'localhost',
  $oamadminserverport         = 7001,
  $domain_configure           = true, # 11g register ohs instance with a domain
  $instance_name              = undef,
  $machine_name               = undef,
  $weblogic_user              = 'weblogic',
){
  # Must include domain_name
  unless $domain_name {
    fail('A webtier must be associated with a domain.')
  }

  # Must include weblogic password
  unless $weblogic_password {
    fail('A weblogic password is needed to modify a webtier.')
  }

  ::orawls::utils::webtier { $name:
    domain_name            => undef,
    weblogic_password      => undef,
    version                => $::weblogic::version,  # 1036|1111|1211|1212
    weblogic_home_dir      => $::weblogic::weblogic_home_dir, # /opt/oracle/middleware11gR1/wlserver_103
    middleware_home_dir    => $::weblogic::middleware_home_dir, # /opt/oracle/middleware11gR1
    jdk_home_dir           => $::weblogic::jdk_home_dir, # /usr/java/jdk1.7.0_45
    wls_domains_dir        => $::weblogic::wls_domains_dir,
    adminserver_address    => 'localhost',
    adminserver_port       => 7001,
    action_name            => 'create', #create|delete
    webgate_configure      => false,
    webgate_agentname      => undef,
    webgate_hostidentifier => undef,
    oamadminserverhostname => 'localhost',
    oamadminserverport     => 7001,
    domain_configure       => true, # 11g register ohs instance with a domain
    instance_name          => undef,
    machine_name           => undef,
    weblogic_user          => 'weblogic',
    os_user                => $::weblogic::os_user, # oracle
    os_group               => $::weblogic::os_group, # dba
    download_dir           => $::weblogic::download_dir, # /data/install
    log_output             => $::weblogic::log_output, # true|false
  }
}
