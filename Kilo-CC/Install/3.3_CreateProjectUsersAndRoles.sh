#----Create the service entity and API endpoint

#----To configure prerequisites
#----1. Configure the authentication token:
export OS_TOKEN=xxxxxaaaaabbbbb

#----2. Configure the endpoint URL:
export OS_URL=http://controller:35357/v2.0



#----To create tenants, users, and roles
#----1. Create an administrative project, user, and role for administrative operations
#----a. Create the admin project:
openstack project create --description "Admin Project" admin

#----b. Create the admin user:
echo "Create the admin user now"
openstack user create --password-prompt admin

#----c. Create the admin role:
openstack role create admin

#----d. Add the admin role to the admin project and user:
openstack role add --project admin --user admin admin

#----2. This guide uses a service project that contains a unique user for each service 
#       that you add to your environment

#----Create the service project:
openstack project create --description "Service Project" service



#----3. Regular (non-admin) tasks should use an unprivileged project and user.
#       As an example, this guide creates the demo project and user.

#----a. Create the demo project:
openstack project create --description "Demo Project" demo

#----b. Create the demo user:
echo "Create the demo user Now:"
openstack user create --password-prompt demo

#----c. Create the user role:
openstack role create user

#----d. Add the user role to the demo project and user:
openstack role add --project demo --user demo user


