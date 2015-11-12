#----Create the service entity and API endpoint

#----To configure prerequisites
#----1. Configure the authentication token:
export OS_TOKEN=xxxxxaaaaabbbbb

#----2. Configure the endpoint URL:
export OS_URL=http://controller:35357/v2.0




#----To create the service entity and API endpoint
#----1. Create the service entity for the Identity service:

openstack service create \
  --name keystone --description "OpenStack Identity" identity

#----2. Create the Identity service API endpoint:
openstack endpoint create \
  --publicurl http://controller:5000/v2.0 \
  --internalurl http://controller:5000/v2.0 \
  --adminurl http://controller:35357/v2.0 \
  --region RegionOne \
  identity


