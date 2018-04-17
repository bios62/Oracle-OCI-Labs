#!/bin/bash
#
# (C) Inge Os 2018
#
if [ "$EUID" -ne 0 ]
    then echo "Please run under sudo, or as root"
    exit 1
fi
if [[ $( grep -c "Maipo" /etc/redhat-release ) -gt 0 ]]
    # Oracle Linux 7
    then CMD_PREFIX=/usr
else
    CMD_PREFIX=""
fi
# Fix existing users
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
