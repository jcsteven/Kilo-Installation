#----Configure Network
cp interfaces /etc/network/interfaces
cp hostname /etc/hostname


#----Configure Name  resolution
cp hosts /etc/hosts

#----To configure the NTP service
cp ntp.conf /etc/ntp.conf

#-----2.Edit the /etc/nova/nova.conf file and complete the following actions:
cp nova.conf /etc/nova/nova.conf
#chown -R nova /etc/nova/nova.conf
#chgrp -R nova /etc/nova/nova.conf

#-----Edit the [libvirt] section in the /etc/nova/nova-compute.conf file
cp nova-compute.conf /etc/nova/nova-compute.conf

#-----1. Edit the /etc/sysctl.conf file to contain the following parameters:
cp sysctl.conf /etc/sysctl.conf

#-----To configure the Networking common components
#-----Edit the /etc/neutron/neutron.conf file,
cp neutron.conf  /etc/neutron/neutron.conf

#-----To configure the Modular Layer 2 (ML2) plug-in
#-----Edit the /etc/neutron/plugins/ml2/ml2_conf.ini
cp ml2_conf.ini /etc/neutron/plugins/ml2/ml2_conf.ini






