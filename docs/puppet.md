## puppet

    puppet apply --noop --verbose --modulepath ./modules manifests/site.pp
    puppet agent --disable "message"
    puppet agent --enable

    puppet describe --list
    puppet resource <type> <specific>

    facter -p

    cat /opt/puppetlabs/puppet/cache/state/classes.txt
