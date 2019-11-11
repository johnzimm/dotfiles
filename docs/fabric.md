## Fabric
    http://docs.fabfile.org/en/1.13/usage/fab.html

    fab --gateway=<jumpbox> --hosts=<hostname> -- arbitrary_command arbitrary_argument

        --roles=role1,role2,role3 --exclude-hosts=host1,host2
        --skip-bad-hosts --abort-on-prompts
        --parallel --linewise --pool-size=<env.pool_size>
        --user=<env.user>
