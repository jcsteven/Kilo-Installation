#----Verify operation Image


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

#---List agents to verify successful launch of the neutron agents:
neutron agent-list

#----2. List loaded extensions to verify successful launch of the neutron-server process:
neutron ext-list








 




