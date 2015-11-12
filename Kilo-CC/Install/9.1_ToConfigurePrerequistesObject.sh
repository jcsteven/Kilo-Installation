#----1. To create the database, complete these 

#----2.Source the admin credentials to gain access to admin-only CLI commands:
source admin-openrc.sh

#----3. To create the service credentials, complete these steps:
#---- a. Create swift user: 
echo "Create the swift user:"
openstack user create --password-prompt swift

#---- b. Add the admin role to the swift user:
openstack role add --project service --user swift admin

#---- c. Create the swift service entity:
openstack service create --name swift \
  --description "OpenStack Object Storage" object-store

#---- 3. Create the Object Storage service API endpoint:
openstack endpoint create \
  --publicurl 'http://controller:8080/v1/AUTH_%(tenant_id)s' \
  --internalurl 'http://controller:8080/v1/AUTH_%(tenant_id)s' \
  --adminurl http://controller:8080 \
  --region RegionOne \
  object-store





