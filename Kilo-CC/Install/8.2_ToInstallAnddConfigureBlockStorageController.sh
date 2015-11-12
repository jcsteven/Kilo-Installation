source comm.sh


#----To install the Block Storage controller  components

#----1. Install the packages:
apt-get install cinder-api cinder-scheduler python-cinderclient -y

#---backup configuration
cp  /etc/cinder/cinder.conf  $OETC_DIR/cinder.conf

#---- 2. Edit the /etc/cinder/cinder.conf filefile and complete the following actions:
cp cinder.conf  /etc/cinder/cinder.conf
#chown -r cinder /etc/cinder/cinder.conf
#chgrp -R cinder /etc/cinder/cinder.conf


#-----1.Populate the Block Storage database:
su -s /bin/sh -c "cinder-manage db sync" cinder


#---- To finalize installation
#----1. Restart the Block Storage services
service cinder-scheduler restart
service cinder-api restart

#---- By default, the Ubuntu packages create an SQLite database.
#---- Because this configuration uses a SQL database server, 
#---- you can remove the SQLite database file:
rm -f /var/lib/cinder/cinder.sqlite

