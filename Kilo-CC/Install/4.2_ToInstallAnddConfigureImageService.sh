source comm.sh

#----To Install and configure the Image service components

#----1. Install the packages:
apt-get install glance python-glanceclient -y

#---backup configuration
cp  /etc/glance/glance-api.conf $OETC_DIR/glance-api.conf
cp  /etc/glance/glance-registry.conf   $OETC_DIR/glance-registry.conf


#----2. Edit the /etc/glance/glance-api.conf file 
cp glance-api.conf /etc/glance/glance-api.conf

#----3.Edit the /etc/glance/glance-registry.conf file
cp glance-registry.conf /etc/glance/glance-registry.conf

#----4. Populate the Image service database:
su -s /bin/sh -c "glance-manage db_sync" glance


#---- To finalize installation
#---- 1. Restart the Image service services:
service glance-registry restart
service glance-api restart

#---- 2. By default, the Ubuntu packages create an SQLite database.
rm -f /var/lib/glance/glance.sqlite

#WaitForAnyKey "Glance mage service components installed!!"

