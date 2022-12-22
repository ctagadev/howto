#!bin/bash
if [ "$EUID" -ne 0 ]
    then echo "This script has to be run with ROOT"
    exit
fi

dnfUpdate () {
    dnf update -y
}
dnfUpdate

dnfInstall () {
    dnf install @minimal-environment -y 
    dnf install open-vm-tools nano -y
    dnf install epel-release -y
}
dnfInstall

crbEnable () {
    /usr/bin/crb enable
}
crbEnable

selinux () {
    sed -i 's/SELINUX=enforcing/SELINUX=permissive/g' "/etc/selinux/config"
}
selinux

reboot () {
    shutdown -r now
}
reboot