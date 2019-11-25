# Raspberry Pi

## Raspbian Release Upgrade

```
sudo apt-get update && sudo apt-get upgrade -y

dpkg -C
apt-mark showhold

sudo sed -i 's/stretch/buster/g' /etc/apt/sources.list    
sudo sed -i 's/stretch/buster/g' /etc/apt/sources.list.d/raspi.list

grep -lnr stretch /etc/apt

sudo apt-get remove apt-listchanges

sudo apt-get update && sudo apt-get full-upgrade -y

sudo apt-get autoremove -y && sudo apt-get autoclean

cat /etc/os-release

sudo rpi-update 

reboot

sudo apt-get install -f

sudo aptitude update && sudo aptitude upgrade -y
```
