source comm.sh

#---backup configuration
cp  /etc/sysctl.conf  $OETC_DIR/sysctl.conf

#-----To configure prerequisites
#-----1.Edit the /etc/sysctl.conf file to contain the following parameters:

cp sysctl.conf /etc/sysctl.conf

#-----2.Implement the changes:
sysctl -p

#-----To install the Networking components
apt-get install neutron-plugin-ml2 neutron-plugin-openvswitch-agent \
neutron-l3-agent neutron-dhcp-agent neutron-metadata-agent  -y
  

#---backup configuration
cp   /etc/neutron/neutron.conf  $OETC_DIR/neutron.conf
cp /etc/neutron/plugins/ml2/ml2_conf.ini $OETC_DIR/ml2_conf.ini 
cp /etc/neutron/l3_agent.ini $OETC_DIR/l3_agent.ini
cp /etc/neutron/dhcp_agent.ini $OETC_DIR/dhcp_agent.ini
cp /etc/neutron/metadata_agent.ini $OETC_DIR/metadata_agent.ini

  
#-----To configure the Networking common components
#-----Edit the /etc/neutron/neutron.conf file
## owner:root/group neutron
cp neutron.conf /etc/neutron/neutron.conf


#-----To configure the Modular Layer 2 (ML2) plug-in
#-----Edit the /etc/neutron/plugins/ml2/ml2_conf.ini file
## owner:root/group neutron
cp ml2_conf.ini /etc/neutron/plugins/ml2/ml2_conf.ini

#-----To configure the Layer-3 (L3) agent
#-----Edit the /etc/neutron/l3_agent.ini file
## owner:root/group neutron
cp l3_agent.ini /etc/neutron/l3_agent.ini


#-----To configure the DHCP agent
#-----Edit the /etc/neutron/dhcp_agent.ini file
## owner:root/group neutron
cp dhcp_agent.ini /etc/neutron/dhcp_agent.ini

#-----Create and edit the /etc/neutron/dnsmasq-neutron.conf file 
cp dnsmasq-neutron.conf /etc/neutron/dnsmasq-neutron.conf

#-----Kill any existing dnsmasq processes:
pkill dnsmasq

#-----To configure the metadata agent
#-----1.Edit the /etc/neutron/metadata_agent.ini
cp metadata_agent.ini /etc/neutron/metadata_agent.ini

#-----To configure the Open vSwitch (OVS) service
service openvswitch-switch restart

#-----Add the external bridge:
ovs-vsctl add-br br-ex

#------Add a port to the external bridge that connects to the physical 
#------external network interface:
#ovs-vsctl add-port br-ex INTERFACE_NAME
ovs-vsctl add-port br-ex eth2

#-----To finalize the installation
#-----Restart the Networking services:
service neutron-plugin-openvswitch-agent restart
service neutron-l3-agent restart
service neutron-dhcp-agent restart
service neutron-metadata-agent restart









