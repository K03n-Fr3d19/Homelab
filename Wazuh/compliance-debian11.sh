#
#   CIS Debian Linux 11 Benchmark v1.0.0
#
### CRON PERMISSIONS ###
chown root:root /etc/cron.d/ && chmod og-rwx /etc/cron.d/
chown root:root /etc/crontab && chmod og-rwx /etc/crontab
chown root:root /etc/cron.hourly/ && chmod og-rwx /etc/cron.hourly/
chown root:root /etc/cron.daily/ && chmod og-rwx /etc/cron.daily/
chown root:root /etc/cron.weekly/ && chown root:root /etc/cron.weekly/
chown root:root /etc/cron.monthly/ && chmod og-rwx /etc/cron.monthly/
### DISABLE DANGEROUS SERVICES ###
apt purge telnet
apt purge talk
### INSTALL SUDO FOR PERMISSION MANAGEMENT ###
apt install sudo
### SET PERMISSIONS FOR SHADOW ###
chown root:shadow /etc/shadow && chmod u-x,g-wx,o-rwx /etc/shadow
chown root:shadow /etc/shadow- && chmod u-x,g-wx,o-rwx /etc/shadow-
chown root:shadow /etc/gshadow && chmod u-x,g-wx,o-rwx /etc/gshadow
chown root:shadow /etc/gshadow- && chmod u-x,g-wx,o-rwx /etc/gshadow-
