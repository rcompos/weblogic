# == define: orawls::utils::orainst
#
#  creates oraInst.loc for oracle products
#
#
##
define orawls::utils::orainst
(
  $ora_inventory_dir = undef,
  )
  {

    ::orawls::utils::orainst { $name:
      ora_inventory_dir => undef,
      os_group          => $::weblogic::os_group,
    }
  }
