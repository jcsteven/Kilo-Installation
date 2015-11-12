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

#---- 3.List service components to verify successful launch of each process:
cinder service-list

#---- 4. Source the demo credentials to perform the following steps as a non-administrative project:
source demo-openrc.sh

#---- 5. Create a 1 GB volume:
cinder create --name demo-volume1 1
cinder create --name demo-volume2 1

#---- 6. Verify creation and availability of the volume:
cinder list












 




