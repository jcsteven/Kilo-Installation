source comm.sh

#----Install and configure a compute node

#----1. Install the packages:
apt-get install nova-api nova-cert nova-conductor nova-consoleauth -y
apt-get install  nova-novncproxy nova-scheduler python-novaclient -y

#---backup configuration
cp  /etc/nova/nova.conf  $OETC_DIR/nova.conf 


#---- 2. Edit the /etc/nova/nova.conf file and complete the following actions:
cp nova.conf /etc/nova/nova.conf
#chown -R nova /etc/nova/nova.conf
#chgrp -R nova /etc/nova/nova.conf

#----3. Populate the Compute database:
su -s /bin/sh -c "nova-manage db sync" nova

#----To finalize installation

#----1. Restart the Compute services:
service nova-api restart
service nova-cert restart
service nova-consoleauth restart
service nova-scheduler restart
service nova-conductor restart
service nova-novncproxy restart

#----By default, the Ubuntu packages create an SQLite database.
#----2. Because this configuration uses a SQL database server, 
#       you can remove the SQLite database file:
rm -f /var/lib/nova/nova.sqlite

#WaitForAnyKey "Nova service components installed!!"
