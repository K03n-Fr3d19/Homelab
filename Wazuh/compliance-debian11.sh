#
#   CIS Debian Linux 11 Benchmark v1.0.0
#
### UPDATES ANY OUTDATED PACKAGES ###
apt update
apt -s upgrade
apt upgrade -y
### CRON PERMISSIONS ###
chown root:root /etc/cron.d/ && chmod og-rwx /etc/cron.d/
chown root:root /etc/crontab && chmod og-rwx /etc/crontab
chown root:root /etc/cron.hourly/ && chmod og-rwx /etc/cron.hourly/
chown root:root /etc/cron.daily/ && chmod og-rwx /etc/cron.daily/
chown root:root /etc/cron.weekly/ && chown root:root /etc/cron.weekly/
chown root:root /etc/cron.monthly/ && chmod og-rwx /etc/cron.monthly/
### SET PERMISSIONS OF BOOTLOADER (GRUB) ###
chown root:root /boot/grub/grub.cfg
chmod u-wx,go-rwx /boot/grub/grub.cfg
### DISABLE DANGEROUS SERVICES ###
apt purge telnet
apt purge talk
### INSTALL & SETUP AIDE ###
apt install aide aide-common
mv /var/lib/aide/aide.db.new /var/lib/aide/aide.db
### INSTALL SUDO FOR PERMISSION MANAGEMENT ###
apt install sudo -y
### SET PERMISSIONS FOR SHADOW ###
chown root:shadow /etc/shadow && chmod u-x,g-wx,o-rwx /etc/shadow
chown root:shadow /etc/shadow- && chmod u-x,g-wx,o-rwx /etc/shadow-
chown root:shadow /etc/gshadow && chmod u-x,g-wx,o-rwx /etc/gshadow
chown root:shadow /etc/gshadow- && chmod u-x,g-wx,o-rwx /etc/gshadow-
### SET PERMISSIONS FOR SSH CONFIG ###
chown root:root /etc/ssh/sshd_config && chmod og-rwx /etc/ssh/sshd_config
### INSTALL AppArmor ###
apt install apparmor apparmor-utils -y
### INSTALL UFW (Uncomplicated Firewall) ###
apt install ufw -y
### INSTALL & SETUP AUDITD ###
apt install auditd audispd-plugins -y
systemctl --now enable auditd
### USERS THAT ARE INACTIVE FOR 30 DAYS OR MORE ARE AUTMATICLY DISABLED ###
useradd -D -f 30
### JOURNALD SETTINGS ###
systemctl --now disable systemd-journal-remote.socket
### UFW SETUP ###
ufw allow ssh
systemctl --now enable ufw.service active
ufw enable
ufw allow in on lo
ufw allow out on lo
ufw deny in from 127.0.0.0/8
ufw deny in from ::1
ufw default deny incoming
ufw default deny routed
ufw status
