#============================================
#----Configure Network
cp /etc/network/interfaces interfaces

cp /etc/hosts hosts

cp /etc/hostname hostname


cp /etc/ntp.conf  ntp.conf

#----Configure Name  resolution

cp /etc/sysctl.conf  sysctl.conf

cp /etc/neutron/neutron.conf neutron.conf

cp  /etc/neutron/plugins/ml2/ml2_conf.ini ml2_conf.ini

cp  /etc/neutron/l3_agent.ini  l3_agent.ini

cp /etc/neutron/dhcp_agent.ini dhcp_agent.ini

cp /etc/neutron/metadata_agent.ini metadata_agent.ini 



