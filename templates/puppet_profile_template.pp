###############################################################################
# Profile: Something Something
#  - 
#
class profile::something::something {

  #############################################################################
  # Variables
  #
  $port             = hiera('profile::something::something::port',             '80')
  $allowed_networks = hiera('profile::something::something::allowed_networks', [])


  #############################################################################
  # Calculated Variables
  #
  $allowed_networks_default = []
  $_allowed_networks = concat($allowed_networks_default, $allowed_networks)

  #############################################################################
  # Configuration
  #


  #############################################################################
  # Maintenance
  #


  #############################################################################
  # Orchestration
  #


  #############################################################################
  # Monitoring
  #


  #############################################################################
  # Firewall Rules
  #
  $_allowed_networks.each | $allowed_network | {
    ensure_resource('firewall', "500 allow tcp/${port} from ${allowed_network}",
      {
        dport  => $port,
        proto  => 'tcp',
        source => $allowed_network,
        action => 'accept',
      }
    )
  }

} # end class
