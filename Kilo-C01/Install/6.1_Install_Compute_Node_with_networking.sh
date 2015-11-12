source comm.sh

#---backup configuration
cp  /etc/sysctl.conf  $OETC_DIR/sysctl.conf

#-----1. Edit the /etc/sysctl.conf file to contain the following parameters:
cp sysctl.conf /etc/sysctl.conf

#-----2.Implement the changes:
sysctl -p

#-----To install the Networking components
apt-get install neutron-plugin-ml2 neutron-plugin-openvswitch-agent -y

#---backup configuration
cp   /etc/neutron/neutron.conf  $OETC_DIR/neutron.conf
cp /etc/neutron/plugins/ml2/ml2_conf.ini $OETC_DIR/ml2_conf.ini 



#-----To configure the Networking common components
#-----Edit the /etc/neutron/neutron.conf file,
cp neutron.conf  /etc/neutron/neutron.conf

#-----To configure the Modular Layer 2 (ML2) plug-in
#-----Edit the /etc/neutron/plugins/ml2/ml2_conf.ini
cp ml2_conf.ini /etc/neutron/plugins/ml2/ml2_conf.ini

#-----To configure the Open vSwitch (OVS) service
#-----Restart the OVS service:
service openvswitch-switch restart


#-----To configure Compute to use Networking
#-----Edit the /etc/nova/nova.conf file 
#cp nova.conf /etc/nova/nova.conf --this is no need

#-----To finalize the installation
#---- 1.Restart the Compute service
service nova-compute restart

#-----2. Restart the Open vSwitch (OVS) agent:
service neutron-plugin-openvswitch-agent restart









