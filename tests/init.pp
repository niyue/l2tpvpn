# The baseline for module testing used by Puppet Labs is that each manifest
# should have a corresponding test manifest that declares that class or defined
# type.
#
# Tests are then run by using puppet apply --noop (to check for compilation errors
# and view a log of events) or by fully applying the test in a virtual environment
# (to compare the resulting system state to the desired state).
#
# Learn more about module testing here: http://docs.puppetlabs.com/guides/tests_smoke.html
#
# multiple VPN users can be specified in the 'credentials' hash like below:
# class {'l2tpvpn': 
#  shared_key => 'your_shared_key',
#  credentials => {'user1' => 'password1', 'user2' => 'password2'},
# }

class {'l2tpvpn': 
  shared_key => 'n0lif3',
  credentials => {'sun' => 'n0lif3'},
}
