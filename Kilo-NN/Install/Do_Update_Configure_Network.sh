#----Configure Name  resolution
cp interface /etc/network/interface

cp hostname /etc/hostname

cp hosts /etc/hosts

cp ntp.conf /etc/ntp.conf

cp sysctl.conf /etc/sysctl.conf



cp neutron.conf /etc/neutron/neutron.conf

cp ml2_conf.ini /etc/neutron/plugins/ml2/ml2_conf.ini

cp l3_agent.ini /etc/neutron/l3_agent.ini

cp dhcp_agent.ini /etc/neutron/dhcp_agent.ini

cp dnsmasq-neutron.conf /etc/neutron/dnsmasq-neutron.conf

cp metadata_agent.ini /etc/neutron/metadata_agent.ini



