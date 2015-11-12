#2.==============================
#----Install the NTP service
apt-get install ntp -y

#----To enable the OpenStack repository
apt-get install ubuntu-cloud-keyring -y

echo "deb http://ubuntu-cloud.archive.canonical.com/ubuntu" \
"trusty-updates/kilo main" > /etc/apt/sources.list.d/cloudarchive-kilo.list

#----Upgrade the packages on your system
apt-get update
apt-get dist-upgrade -y

#----SQL database
#----Install the packages:
apt-get install mariadb-server python-mysqldb -y

#----Message queue
#----Install the package:
apt-get install rabbitmq-server -y

#3.==============================
#----2.Run the following command to install the packages:
apt-get install keystone python-openstackclient apache2 libapache2-mod-wsgi -y
apt-get install  memcached python-memcache -y

#4.==============================
#----1. Install the packages:
apt-get install glance python-glanceclient -y

#5.==============================
#----1. Install the packages:
apt-get install nova-api nova-cert nova-conductor nova-consoleauth -y
apt-get install  nova-novncproxy nova-scheduler python-novaclient -y

#6.==============================
#----To install the Networking components
#----1. Install the packages:
apt-get install neutron-server neutron-plugin-ml2 python-neutronclient -y

#7.==============================
#-----Install the dashboard components
#-----Install the packages:
apt-get install openstack-dashboard -y

