source comm.sh
mkdir $OETC_DIR

#---backup configuration
#----Configure Network
cp /etc/network/interfaces $OETC_DIR/interfaces
#----Configure Name  resolution
cp /etc/hosts $OETC_DIR/hosts
cp /etc/hostname $OETC_DIR/hostname


#----Install the NTP service
apt-get install ntp -y

#---backup configuration
cp  /etc/ntp.conf  $OETC_DIR/ntp.conf


#----To configure the NTP service
cp ntp.conf /etc/ntp.conf

#----Remove the /var/lib/ntp/ntp.conf.dhcp file if it exists.
rm -f /var/lib/ntp/ntp.conf.dhcp

#---Restart the NTP service:
service ntp restart

#---Verify operation
#ntpq -c peers

#ntpq -c assoc

#----To enable the OpenStack repository
apt-get install ubuntu-cloud-keyring -y

echo "deb http://ubuntu-cloud.archive.canonical.com/ubuntu" \
"trusty-updates/kilo main" > /etc/apt/sources.list.d/cloudarchive-kilo.list

#----Upgrade the packages on your system
apt-get update 
apt-get dist-upgrade -y

