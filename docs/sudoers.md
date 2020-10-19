
## Sudoers Examples

```
# User_Alias
  User_Alias   USRGRP1 = user1, user2, user3

# Runas_Alias
  Runas_Alias  RUNGRP1 = user1, user2, user3

# Cmnd_Alias
  Cmnd_Alias   CMD1 = /sbin/cmd1, /sbin/cmd2

# USER(S)    HOST(S)    RUNAS     TAG       CMD
  root       ALL      = (ALL:ALL)           ALL
  root       ALL      = (ALL:ALL) NOPASSWD: ALL
  %wheel     ALL      = (ALL:ALL)           ALL
  %wheel     ALL      = (ALL:ALL) NOPASSWD: ALL
  username   ALL      = (ALL)               ALL
  %group     ALL      = (ALL)               ALL
  username   ALL      = (user2)   NOPASSWD: ALL
```

## Sudo Usage

```
sudo su -
sudo -iu username
sudo -iu username /path/to/command --parameter=something
```
