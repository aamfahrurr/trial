cd
if [[ -e /etc/debian_version ]]; then
	OS=debian
else
	OS=centos
	fi
if [[ "$OS" = 'debian' ]]; then
					apt-get remove webmin -y
					apt-get install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python -y
					wget http://prdownloads.sourceforge.net/webadmin/webmin_1.831_all.deb
					dpkg --install webmin_1.831_all.deb
					rm webmin_1.831_all.deb
				else
					yum remove webmin -y
					yum -y install perl perl-Net-SSLeay openssl perl-IO-Tty
                    wget http://prdownloads.sourceforge.net/webadmin/webmin-1.831-1.noarch.rpm
                    rpm -i webmin-1.831-1.noarch.rpm;
                    rm webmin-1.831-1.noarch.rpm
				fi
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
chattr +i /etc/webmin/miniserv.conf
wget -O /usr/local/bin/trial "https://raw.githubusercontent.com/aamfahrurr/trial/master/trial.txt"
chmod +x /usr/local/bin/trial
service webmin restart
chkconfig webmin on
clear
history -c
echo "Server telah disesuaikan dengan settingan OCSPanel.ID"
