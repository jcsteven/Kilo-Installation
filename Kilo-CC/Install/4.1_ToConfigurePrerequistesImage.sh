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
#----  a. Create the glance user:
echo "Create the glance user:"
openstack user create --password-prompt glance

#---- b. Add the admin role to the glance user and service project:

openstack role add --project service --user glance admin

#---- c.Create the glance service entity:
openstack service create --name glance \
  --description "OpenStack Image service" image

#----4. Create the Image service API endpoint:
openstack endpoint create \
  --publicurl http://controller:9292 \
  --internalurl http://controller:9292 \
  --adminurl http://controller:9292 \
  --region RegionOne \
  image







