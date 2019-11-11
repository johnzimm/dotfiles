## Compare RPMs

    rpm -qa --queryformat='%{NAME}\n' | sort > $(hostname)-packages.txt
    diff server1-packages.txt server2-packages.txt
