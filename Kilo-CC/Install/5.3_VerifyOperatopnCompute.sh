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

#----2. List service components to verify successful launch and registration of each process:
nova service-list

#----3. List API endpoints in the Identity service to verify connectivity with the Identity service:
nova endpoints

#----4.List images in the Image service catalog to verify connectivity with the Image service:
nova image-list
 
 




