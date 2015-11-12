#----Configure Name  resolution
cp /etc/hosts hosts
cp   /etc/hostname hostname

cp  /etc/network/interfaces  interfaces



#-----Start the NTP service:
#----To configure the NTP service
cp  /etc/ntp.conf ntp.conf

#service ntp restart
#=====Database
#-----Restart the database service:
cp   /etc/mysql/conf.d/mysqld_openstack.cnf  mysqld_openstack.cnf


#-----
#----3. Edit the /etc/keystone/keystone.conf
cp  /etc/keystone/keystone.conf keystone.conf 



#----To configure the Apache HTTP server
#----1. Edit the /etc/apache2/apache2.conf file and configure 
#----    the ServerName option to reference the controller node: 
cp  /etc/apache2/apache2.conf apache2.conf



#----2. Create the /etc/apache2/sites-available/wsgi-keystone.conf file 
cp /etc/apache2/sites-available/wsgi-keystone.conf wsgi-keystone.conf

 
#----2. Edit the /etc/glance/glance-api.conf file 
cp /etc/glance/glance-api.conf glance-api.conf 

#----3.Edit the /etc/glance/glance-registry.conf file
cp /etc/glance/glance-registry.conf  glance-registry.conf 


#---- 2. Edit the /etc/nova/nova.conf file and complete the following actions:
cp /etc/nova/nova.conf  nova.conf 
#chown -R nova /etc/nova/nova.conf
#chgrp -R nova /etc/nova/nova.conf


#----To configure the Networking server component
#---- Edit the /etc/neutron/neutron.conf filefile and complete the following actions:
cp  /etc/neutron/neutron.conf neutron.conf 
#chown -r root /etc/neutron/neutron.conf
#chgrp -R neutron /etc/neutron/neutron.conf

#---- To configure the Modular Layer 2 (ML2) plug-in
#---- Edit the /etc/neutron/plugins/ml2/ml2_conf.ini 
cp  /etc/neutron/plugins/ml2/ml2_conf.ini ml2_conf.ini

#chown -R root /etc/neutron/plugins/ml2/ml2_conf.ini
#chgrp -R neutron /etc/neutron/plugins/ml2/ml2_conf.ini



#--------To configure the dashboard
#-----To configure the dashboard
#-----Edit the /etc/openstack-dashboard/local_settings.py file
cp /etc/openstack-dashboard/local_settings.py local_settings.py 

cp /etc/keystone/keystone-paste.ini keystone-paste.ini


