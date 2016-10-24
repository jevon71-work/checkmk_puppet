
node '' {

  notify {"hello checkmk Server!":}
      include check_mk

}

# execute 'apt-get update'

exec { 'apt-update':                    # exec resource named 'apt-update'
  command => '/usr/bin/apt-get update'  # command this resource will run
}



Exec{ 'apt-get -f install':
  command => '/usr/bin/apt-get -f install'

}

