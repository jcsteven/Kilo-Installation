#----1. To create the database, complete these 

#----To configure prerequisites
#----1. Configure the authentication token:
#export OS_TOKEN=xxxxxaaaaabbbbb
#----2. Configure the endpoint URL:
#export OS_URL=http://controller:35357/v2.0

#----2.Source the admin credentials to gain access to admin-only CLI commands:
#export OS_PROJECT_DOMAIN_ID=default
#export OS_USER_DOMAIN_ID=default
#export OS_PROJECT_NAME=admin
#export OS_TENANT_NAME=admin
#export OS_USERNAME=admin
#export OS_PASSWORD=ppooiiuu
#export OS_AUTH_URL=http://controller:35357/v3
#export OS_IMAGE_API_VERSION=2

source admin-openrc.sh

#----3. To create the service credentials, complete these steps:
#----  a. Create the nova user:
echo "Create the nova user:"
openstack user create --password-prompt nova

#---- b. Add the admin role to the nova user:

openstack role add --project service --user nova admin

#---- c. Create the nova service entity:
openstack service create --name nova \
--description "OpenStack Compute" compute


#----4. Create the Compute service API endpoint:
openstack endpoint create \
--publicurl http://controller:8774/v2/%\(tenant_id\)s \
--internalurl http://controller:8774/v2/%\(tenant_id\)s \
--adminurl http://controller:8774/v2/%\(tenant_id\)s \
--region RegionOne \
compute






