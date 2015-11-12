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
cp  ntp.conf /etc/ntp.conf



#----Remove the /var/lib/ntp/ntp.conf.dhcp file if it exists.
rm -f /var/lib/ntp/ntp.conf.dhcp

#---Restart the NTP service:
service ntp restart

#---Verify operation
#ntpq -c peers

#ntpq -c assoc

##WaitForAnyKey "NTP components installed!!"

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


#----Create and edit the /etc/mysql/conf.d/mysqld_openstack.cnf file
cp  mysqld_openstack.cnf /etc/mysql/conf.d/mysqld_openstack.cnf

#----1. Restart the database service:
service mysql restart
#---2. Secure the database service:
mysql_secure_installation

##WaitForAnyKey "SQL database has installed!!"

##--There is a step that doesn't show  in the guide
#curl -O https://www.rabbit.com/rabbitmq-signing-key-public.asc
# apt-get add rabbitmq-signing-key-public.asc
# echo "deb http://www.rabbitmq.com/debian/testing".....


#----Message queue
#----Install the package:
apt-get install rabbitmq-server -y


#----To configure the message queue service
#----1. Add the openstack user: RABBIT_PASS=1234
#rabbitmqctl add_user openstack RABBIT_PASS
rabbitmqctl add_user openstack 1234

#----2.Permit configuration, write, and read access for the openstack user:
rabbitmqctl set_permissions openstack ".*" ".*" ".*"

##WaitForAnyKey "Message Queue has installed!!"
