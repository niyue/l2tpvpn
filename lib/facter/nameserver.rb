#
# nameserver.rb
#
# This fact provides information about the nameserver specified in the system
#

require 'facter'

if Facter.value(:kernel) == 'Linux'
  nameserver = ''

  Facter::Util::Resolution.exec('cat /etc/resolv.conf').each_line do |line|
    line.strip!
    if line.match(/nameserver .*/)
      nameserver = line.split(/\s+/)[1]
    else
      next
    end
  end

  if nameserver and not nameserver.empty?
    Facter.add('nameserver') do
      confine :kernel => :linux
      setcode { nameserver }
    end
  end
end
