source comm.sh


#----To install the Networking components

#----1. Install the packages:
apt-get install neutron-server neutron-plugin-ml2 python-neutronclient -y

#---backup configuration
cp  /etc/neutron/neutron.conf  $OETC_DIR/neutron.conf 
cp  /etc/neutron/plugins/ml2/ml2_conf.ini $OETC_DIR/ml2_conf.ini



#----To configure the Networking server component
#---- Edit the /etc/neutron/neutron.conf filefile and complete the following actions:
cp neutron.conf  /etc/neutron/neutron.conf
#chown -r root /etc/neutron/neutron.conf
#chgrp -R neutron /etc/neutron/neutron.conf

#---- To configure the Modular Layer 2 (ML2) plug-in
#---- Edit the /etc/neutron/plugins/ml2/ml2_conf.ini 
cp ml2_conf.ini /etc/neutron/plugins/ml2/ml2_conf.ini
#chown -R root /etc/neutron/plugins/ml2/ml2_conf.ini
#chgrp -R neutron /etc/neutron/plugins/ml2/ml2_conf.ini

#---- To configure Compute to use Networking
#---- Edit the /etc/nova/nova.conf file on the controller
#cp  $SETC_DIR/nova.conf   /etc/nova/nova.conf --skip this 
#chown -R nova  /etc/nova/nova.conf 
#chgrp -R nova  /etc/nova/nova.conf 

#---- To finalize installation
#-----1.Populate the Network database:
su -s /bin/sh -c "neutron-db-manage --config-file /etc/neutron/neutron.conf \
  --config-file /etc/neutron/plugins/ml2/ml2_conf.ini upgrade head" neutron

#----2. Restart the Compute services:
service nova-api restart

#----3. Restart the Networking service:
service neutron-server restart

#WaitForAnyKey "Neutron service components installed!!"

