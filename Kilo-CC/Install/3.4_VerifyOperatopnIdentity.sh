#----Verify operation Identify

#----1. For security reasons, disable the temporary authentication token mechanism:
#       Edit the /etc/keystone/keystone-paste.ini file 
#       and remove admin_token_auth from the 
#       [pipeline:public_api], [pipeline:admin_api], and [pipeline:api_v3] sections.
cp keystone-paste.ini-disable /etc/keystone/keystone-paste.ini 

#----2. Unset the temporary OS_TOKEN and OS_URL environment variables:
unset OS_TOKEN OS_URL 

#----3. As the admin user, request an authentication token from 
#       the Identity version 2.0 API:
echo "Input Admin password:"
openstack --os-auth-url http://controller:35357 \
--os-project-name admin --os-username admin --os-auth-type password \
token issue


#---4. The Identity version 3 API adds support for domains that contain 
#      projects and users. Projects and users can use the same names 
#      in different domains. Therefore, in order to use the version 3 API, 
#      requests must also explicitly contain at least the default domain 
#      or use IDs. For simplicity, this guide explicitly uses the 
#      default domain so examples can use names instead of IDs.
echo "Input Admin password:"
openstack --os-auth-url http://controller:35357 \
  --os-project-domain-id default --os-user-domain-id default \
  --os-project-name admin --os-username admin --os-auth-type password \
  token issue


#----5. As the admin user, list projects to verify that the admin user 
#       can execute admin-only CLI commands and that the Identity service 
#       contains the projects that you created in the section called 
#       “Create projects, users, and roles”:
echo " Admin User Password:"

openstack --os-auth-url http://controller:35357 \
  --os-project-name admin --os-username admin --os-auth-type password \
  project list


#----6. As the admin user, list users to verify that the Identity service 
#       contains the users that you created in the section called 
#       “Create projects, users, and roles”:
echo "Admin User password:"
openstack --os-auth-url http://controller:35357 \
  --os-project-name admin --os-username admin --os-auth-type password \
  user list


#----7. As the admin user, list roles to verify that the Identity service 
#       contains the role that you created in the section called 
#       “Create projects, users, and roles”:
echo "Admin User password:"

openstack --os-auth-url http://controller:35357 \
  --os-project-name admin --os-username admin --os-auth-type password \
  role list

#----8. As the demo user, request an authentication token from the 
#       Identity version 3 API:
echo "Demo User Passsword:"

openstack --os-auth-url http://controller:5000 \
  --os-project-domain-id default --os-user-domain-id default \
  --os-project-name demo --os-username demo --os-auth-type password \
  token issue


#----9. As the demo user, attempt to list users to verify that 
#        it cannot execute admin-only CLI commands:

#      ERROR: openstack You are not authorized to perform the requested action,
#             admin_required. (HTTP 403)
echo "Admin User password:"
openstack --os-auth-url http://controller:5000 \
  --os-project-domain-id default --os-user-domain-id default \
  --os-project-name demo --os-username demo --os-auth-type password \
  user list

#----1. enable the temporary authentication token mechanism:
#       Edit the /etc/keystone/keystone-paste.ini file 
#       and [Not]remove admin_token_auth from the 
#       [pipeline:public_api], [pipeline:admin_api], and [pipeline:api_v3] sections.
#cp keystone-paste.ini-orig /etc/keystone/keystone-paste.ini 