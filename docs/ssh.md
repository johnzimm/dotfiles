## SSH

    ssh-copy-id user@remotehost
    cat ~/.ssh/id_rsa.pub | ssh user@remotehost “mkdir ~/.ssh; cat >> ~/.ssh/authorized_keys”
    ssh-keygen -R badhost
    ssh-keygen; ssh-copy-id user@remotehost; ssh user@remotehost
    ssh -i ~/.ssh/identity.pem user@remotehost
    ssh -o "PubkeyAuthentication no" user@remotehost

    ssh -f -N -D 0.0.0.0:1080 localhost -p <PORT>
    ssh -f -N -D 1080 remotehost -p <PORT>
    ssh -f -N -p <ssh_remote_port> username@remote_host -L <local_tunnel_port>:<remote_tunnel_host>:<remote_tunnel_port>
    ssh -L 3306:localhost:3306 user@remotehost
    ssh -R 9000:localhost:8080 user@remotehost
    ssh -t reachable_remotehost ssh unreachable_remotehost

    ssh -L 3389:targetremotehost:3389 username@relayremotehost

    ssh user@remotehost pwd
    ssh -fX user@remotehost gui-program
    ssh user@remotehost cat /path/to/remotefile | diff /path/to/localfile –
    local-command | ssh -C user@remotehost "remote-command"

    sftp user@remotehost:/remotepath/file.txt /localpath/file.txt
    echo "get /remotepath/*" | sftp -b - user@remotehost
    echo "put /localpath/example.txt" | sftp -b - user@remotehost:/remotepath/
