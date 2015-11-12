#----1. To create the database, complete these 

#----2.Source the admin credentials to gain access to admin-only CLI commands:
source admin-openrc.sh

#----3. To create the service credentials, complete these steps:
#---- a. Create a cinder user: 
echo "Create the cinder user:"
openstack user create --password-prompt cinder

#---- b. Add the admin role to the cinder user:
openstack role add --project service --user cinder admin

#---- c. Create the cinder service entity:
openstack service create --name cinder \
  --description "OpenStack Block Storage" volume

openstack service create --name cinderv2 \
  --description "OpenStack Block Storage" volumev2

#---- 4. Create the Block Storage service API endpoints:
openstack endpoint create \
  --publicurl http://controller:8776/v2/%\(tenant_id\)s \
  --internalurl http://controller:8776/v2/%\(tenant_id\)s \
  --adminurl http://controller:8776/v2/%\(tenant_id\)s \
  --region RegionOne \
  volume

openstack endpoint create \
  --publicurl http://controller:8776/v2/%\(tenant_id\)s \
  --internalurl http://controller:8776/v2/%\(tenant_id\)s \
  --adminurl http://controller:8776/v2/%\(tenant_id\)s \
  --region RegionOne \
  volumev2




