#----Configure Network
#cp interfaces /etc/network/interfaces

#----Configure Name  resolution
#cp hosts /etc/hosts

#----To configure the NTP service
#cp ntp.conf /etc/ntp.conf

#-------Start the NTP service:
service ntp restart


#-----2.Edit the /etc/nova/nova.conf file and complete the following actions:
#cp nova.conf /etc/nova/nova.conf
#chown -R nova /etc/nova/nova.conf
#chgrp -R nova /etc/nova/nova.conf

#-----Edit the [libvirt] section in the /etc/nova/nova-compute.conf file
#cp nova-compute.conf /etc/nova/nova-compute.conf

#-----2. Restart the Compute service:
service nova-compute restart

#-----3. you can remove the SQLite database file:
rm -f /var/lib/nova/nova.sqlite


#-----1. Edit the /etc/sysctl.conf file to contain the following parameters:
#cp sysctl.conf /etc/sysctl.conf

#-----2.Implement the changes:
sysctl -p



#-----To configure the Networking common components
#-----Edit the /etc/neutron/neutron.conf file,
#cp neutron.conf  /etc/neutron/neutron.conf

#-----To configure the Modular Layer 2 (ML2) plug-in
#-----Edit the /etc/neutron/plugins/ml2/ml2_conf.ini
#cp ml2_conf.ini /etc/neutron/plugins/ml2/ml2_conf.ini

#-----To configure the Open vSwitch (OVS) service
#-----Restart the OVS service:
service openvswitch-switch restart

#-----To finalize the installation
#---- 1.Restart the Compute service
service nova-compute restart

#-----2. Restart the Open vSwitch (OVS) agent:
service neutron-plugin-openvswitch-agent restart



