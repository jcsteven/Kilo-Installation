
#----Install the NTP service
apt-get install ntp -y


#----To enable the OpenStack repository
apt-get install ubuntu-cloud-keyring -y

echo "deb http://ubuntu-cloud.archive.canonical.com/ubuntu" \
"trusty-updates/kilo main" > /etc/apt/sources.list.d/cloudarchive-kilo.list

#----Upgrade the packages on your system
apt-get update  
apt-get dist-upgrade -y

#-----To install the Networking components
apt-get install neutron-plugin-ml2 neutron-plugin-openvswitch-agent \
  neutron-l3-agent neutron-dhcp-agent -y
  


