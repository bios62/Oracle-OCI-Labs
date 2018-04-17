#!/bin/sh
if [ "$EUID" -ne 0 ]
    then echo "Please run under sudo, or as root"
    exit 1
fi
if [[ $( grep -c "Maipo" /etc/redhat-release ) -gt 0 ]]
    # Oracle Linux 7
    then CMD_PREFIX=/usr
	export VER=OEL7
else
    CMD_PREFIX=""
	export VER=OEL6
fi
# Update Linux
yum update -y
# Add required software
yum install wget –y
yum install zip –y
yum install unzip –y
groupadd -g 600 dba
groupadd -g 601 oinstall
groupadd -g 602 oracle
useradd -g dba -G oinstall oracle
chown oracle:oinstall /home/oracle
#mkdir /home/oracle
grep VERSION /etc/os-release  | grep 7 >/dev/null
if [ "$VER" = "OEL7" ]
then
  systemctl stop firewalld
  systemctl disable firewalld
  yum install mesa-libGL -y
  yum groupinstall "Server with GUI" -y
else
  yum groupinstall "X Window System" "Desktop" "Desktop Platform" "General Purpose Desktop" -y
  yum install xorg-x11-xinit-session -y
  /etc/init.d/messagebus start
  sh /etc/init.d/iptables stop
  chkconfig iptables off
fi
yum install tigervnc-server -y
yum install firefox -y
yum install oracle-rdbms-server-12cR1-preinstall -y
yum install libstdc++.i686 -y
yum install compat-libstdc++-33.x86_64 -y
yum install gcc  -y
yum install kernel-uek-devel -y
yum install kernel-devel -y
#
# Fix issue with password expiring
# Fix existing users
#
if [[ $( $CMD_PREFIX/bin/grep -c ":90:7:90:" /etc/shadow ) -gt 0 ]]; then
    echo "Fixing affected users"
    $CMD_PREFIX/bin/sed -i.bkp 's/:90:7:90:/:99999:7::/g' /etc/shadow
fi
# Change the defaults from useradd: /etc/default/useradd
if [[ $( $CMD_PREFIX/bin/egrep -c "^INACTIVE=90" /etc/default/useradd ) -gt 0 ]]; then
    echo "Fixing useradd defaults"
    $CMD_PREFIX/bin/sed -i.bkp '/INACTIVE=90/d' /etc/default/useradd
    $CMD_PREFIX/bin/sed -i.bkp2 's/#INACTIVE=-1/INACTIVE=-1/g' /etc/default/useradd
fi
# Change the PAM defaults for new users
if [[ $( $CMD_PREFIX/bin/egrep -c "^PASS_MAX_DAYS 90" /etc/login.defs ) -gt 0 ]]; then
    echo "Fixing PAM defaults"
    $CMD_PREFIX/bin/sed -i.bkp '/PASS_MAX_DAYS 90/d' /etc/login.defs
    $CMD_PREFIX/bin/sed -i.bkp2 's/#PASS_MAX_DAYS\s*99999/PASS_MAX_DAYS 99999/g' /etc/login.defs
fi