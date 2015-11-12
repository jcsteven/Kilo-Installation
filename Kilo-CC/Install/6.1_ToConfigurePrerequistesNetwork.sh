#----1. To create the database, complete these 

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
#----  Create the neutron user:
echo "Create the neutron user:"
openstack user create --password-prompt neutron

#---- b. Add the admin role to the neutron user:

openstack role add --project service --user neutron admin

#---- c. Create the neutron service entity:
openstack service create --name neutron \
  --description "OpenStack Networking" network


#----4. Create the Networking service API endpoint:
openstack endpoint create \
  --publicurl http://controller:9696 \
  --adminurl http://controller:9696 \
  --internalurl http://controller:9696 \
  --region RegionOne \
  network






