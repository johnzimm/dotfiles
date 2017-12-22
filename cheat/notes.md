# Notes and Cheat Sheet

Collected snippets of things I find handy


## Redirection

    2>&1 | tee -a /path/to/output.txt

## Find, Replace, Rename

    find . -type f -name "*baz*" -exec sed -i 's/foo/bar/g' {} +
    find . -type f -name '*.log' ! -name '*.gz' -mtime +182 -exec gzip -9 "{}" \;

    for file in *.ext; do mv -vi "$file" "$( echo "$file" | sed "s/regex/replace/" )"; done

    sed -e "s/<VAR1>/${var1}/g" -e "s/<VAR2>/${var2}/g" /path/to/template > /path/to/file

    find * -type d -print0 | xargs -0 chmod 0755 # for directories
    find . -type f -print0 | xargs -0 chmod 0644 # for files

## Date and Time

    date +%Y%m%d%H%M%S
    date +%Y-%m-%d@%H:%M:%S

    touch -c -m -a -t 197001020304.05 file.ext

## Compare RPMs

    rpm -qa --queryformat='%{NAME}\n' | sort > $(hostname)-packages.txt
    diff server1-packages.txt server2-packages.txt

## SSH

    ssh-copy-id user@remotehost
    cat ~/.ssh/id_rsa.pub | ssh user@remotehost “mkdir ~/.ssh; cat >> ~/.ssh/authorized_keys”
    ssh-keygen -R badhost
    ssh-keygen; ssh-copy-id user@remotehost; ssh user@remotehost
    ssh -i ~/.ssh/identity.pem user@remotehost
    ssh -o "PubkeyAuthentication no" user@remotehost

    ssh -f -N -D 0.0.0.0:1080 localhost -p <PORT>
    ssh -f -N -D 1080 remotehost -p <PORT>
    ssh -L 3306:localhost:3306 user@remotehost
    ssh -R 9000:localhost:8080 user@remotehost
    ssh -t reachable_remotehost ssh unreachable_remotehost

    ssh user@remotehost pwd
    ssh -fX user@remotehost gui-program
    ssh user@remotehost cat /path/to/remotefile | diff /path/to/localfile –
    local-command | ssh -C user@remotehost "remote-command"

    sftp user@remotehost:/remotepath/file.txt /localpath/file.txt
    echo "get /remotepath/*" | sftp -b - user@remotehost
    echo "put /localpath/example.txt" | sftp -b - user@remotehost:/remotepath/

## Fabric
    http://docs.fabfile.org/en/1.13/usage/fab.html

    fab --gateway=<jumpbox> --hosts=<hostname> -- arbitrary_command arbitrary_argument

        --roles=role1,role2,role3 --exclude-hosts=host1,host2
        --skip-bad-hosts --abort-on-prompts
        --parallel --linewise --pool-size=<env.pool_size>
        --user=<env.user>

## Git

    git diff mybranch..master -- path/to/file.ext
    git diff-tree --no-commit-id --name-only -r <commit_hash>
    git ls-files --others
    git ls-files --others --exclude-standard
    git grep "string/regexp" $(git rev-list --all)
    git grep "string" $(git show-ref --heads)
    git remote set-url --add --push [remote] [repourl]

## SVN

     svnlook tree --full-paths .
     svn list --depth infinity .

## tmux

    tmux new-session   -d -s <session_name> "<command> <arguments>"
    tmux list-sessions
    tmux has-session   -t <session_name>
    tmux attach        -t <session_name>
    tmux kill-session  -t <session_name>
    tmux list-clients  -t <session_name>
    tmux kill-server
    tmux list-commands

    C-b ?    List of keyboard shortcuts.
    C-b d    Detach from session.
    C-b s    Choose a session from a list.

## wget/curl

    wget -e robots=off --wait 1 -x --user=xxx --password=xxx -m -k http://domain.to.mirror/

## docker

    docker { images | import | build | commit | rmi | load | save }
    docker { history | tag }
    docker { ps | logs | inspect | events | port | top | stats | diff }
    docker { cp | export }
    docker exec -it foo /bin/bash
    docker run -i -t --rm centos /bin/bash

## puppet

    puppet apply --noop --verbose --modulepath ./modules manifests/site.pp
    puppet agent --disable "message"
    puppet agent --enable

    puppet describe --list
    puppet resource <type> <specific>

    facter -p

    cat /opt/puppetlabs/puppet/cache/state/classes.txt

## elastic

    GET /_cat

    GET /_nodes/stats

    GET /_cluster/state

    GET /_cluster/health?pretty

    GET /_cluster/stats?human&pretty

    GET /_cluster/pending_tasks

    GET /_nodes/stats

    GET /_aliases

    GET /<index>/_stats


## vim

    ```
    # vim: set expandtab smarttab tabstop=4 shiftwidth=4 softtabstop=4:
    ```

## emacs

    CTRL-x CTRL-c

## Resources

  - http://commandlinefu.com
  - https://lzone.de

