#----Create Initial Network


#----1. Source the admin credentials to gain access to admin-only CLI commands:
#-----$ source admin-openrc.sh
#export OS_PROJECT_DOMAIN_ID=default
#export OS_USER_DOMAIN_ID=default
#export OS_PROJECT_NAME=admin
#export OS_TENANT_NAME=admin
#export OS_USERNAME=admin
#export OS_PASSWORD=ppooiiuu
#export OS_AUTH_URL=http://controller:35357/v3
#export OS_IMAGE_API_VERSION=2

source admin-openrc.sh

#----2. Create the network:
neutron net-create ext-net --router:external \
  --provider:physical_network external --provider:network_type flat
  
#---- To create a subnet on the external network
#----3. Create the subnet:
#neutron subnet-create ext-net EXTERNAL_NETWORK_CIDR --name ext-subnet \
#  --allocation-pool start=FLOATING_IP_START,end=FLOATING_IP_END \
#  --disable-dhcp --gateway EXTERNAL_NETWORK_GATEWAY

neutron subnet-create ext-net 172.17.10.0/22 --name ext-subnet \
  --allocation-pool start=172.17.10.200,end=172.17.10.250 \
  --disable-dhcp --gateway 172.17.10.251 --dns-nameserver 172.17.10.251

  
  
#---- To create the tenant network
#---- 1. Source the demo credentials to gain access to user-only CLI commands:
#---- $ source demo-openrc.sh 
#export OS_PROJECT_DOMAIN_ID=default
#export OS_USER_DOMAIN_ID=default
#export OS_PROJECT_NAME=demo
#export OS_TENANT_NAME=demo
#export OS_USERNAME=demo
#export OS_PASSWORD=12345678
#export OS_AUTH_URL=http://controller:5000/v3
#export OS_IMAGE_API_VERSION=2

source demo-openrc.sh
#---- 2. Create the network:
neutron net-create demo-net

#---- To create a subnet on the tenant network
#----Create the subnet:
# neutron subnet-create demo-net TENANT_NETWORK_CIDR \
#  --name demo-subnet --gateway TENANT_NETWORK_GATEWAY
neutron subnet-create demo-net 192.168.1.0/24 \
  --name demo-subnet --gateway 192.168.1.1 \
  --dns-nameserver 172.17.10.251  

#---- To create a router on the tenant network and attach the external and tenant networks to it
#---- Create the router:
neutron router-create demo-router

#---- Attach the router to the demo tenant subnet:
neutron router-interface-add demo-router demo-subnet
  
#---- Attach the router to the external network by setting it as the gateway:
neutron router-gateway-set demo-router ext-net 









 




