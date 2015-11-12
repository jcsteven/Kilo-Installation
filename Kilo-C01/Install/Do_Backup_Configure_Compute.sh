#----Configure Network
cp  /etc/network/interfaces interfaces
cp  /etc/hostname hostname


#----Configure Name  resolution
cp /etc/hosts hosts 

#----To configure the NTP service
cp  /etc/ntp.conf ntp.conf

#-----2.Edit the /etc/nova/nova.conf file and complete the following actions:
cp  /etc/nova/nova.conf  nova.conf
#chown -R nova /etc/nova/nova.conf
#chgrp -R nova /etc/nova/nova.conf

#-----Edit the [libvirt] section in the /etc/nova/nova-compute.conf file
cp  /etc/nova/nova-compute.conf nova-compute.conf

#-----1. Edit the /etc/sysctl.conf file to contain the following parameters:
cp  /etc/sysctl.conf sysctl.conf

#-----To configure the Networking common components
#-----Edit the /etc/neutron/neutron.conf file,
cp   /etc/neutron/neutron.conf neutron.conf

#-----To configure the Modular Layer 2 (ML2) plug-in
#-----Edit the /etc/neutron/plugins/ml2/ml2_conf.ini
cp  /etc/neutron/plugins/ml2/ml2_conf.ini ml2_conf.ini





