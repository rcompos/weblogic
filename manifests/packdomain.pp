# == Define: orawls::packdomain
#
# pack a new weblogic domain
##
define weblogic::packdomain (
  $domain_name = undef,
  )
  {
    # Must include domain_name
    unless $domain_name {
      fail('A domain is needed to pack it.')
    }

    ::orawls::packdomain { $name:
      domain_name         => $domain_name,
      version             => $::weblogic::version,  # 1036|1111|1211|1212|1213|1221
      weblogic_home_dir   => $::weblogic::weblogic_home_dir, # /opt/oracle/middleware11gR1/wlserver_103
      middleware_home_dir => $::weblogic::middleware_home_dir, # /opt/oracle/middleware11gR1
      jdk_home_dir        => $::weblogic::jdk_home_dir, # /usr/java/jdk1.7.0_45
      wls_domains_dir     => $::weblogic::wls_domains_dir,
      os_user             => $::weblogic::os_user, # oracle
      os_group            => $::weblogic::os_group, # dba
      download_dir        => $::weblogic::download_dir, # /data/install
      log_output          => $::weblogic::log_output, # true|false
    }
  }
