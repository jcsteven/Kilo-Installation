#----Configure Name  resolution
#cp hosts /etc/hosts

#-----Start the NTP service:
#----To configure the NTP service
#cp ntp.conf /etc/ntp.conf

service ntp restart
#=====Database
#-----Restart the database service:
#cp  mysqld_openstack.cnf /etc/mysql/conf.d/mysqld_openstack.cnf

service mysql restart

#----Restart the message broker service:
#service rabbitmq-server restart

#-----
#----3. Edit the /etc/keystone/keystone.conf
#cp  keystone.conf /etc/keystone/keystone.conf

#----4. Populate the Identity service database:
#su -s /bin/sh -c "keystone-manage db_sync" keystone

#----To configure the Apache HTTP server
#----1. Edit the /etc/apache2/apache2.conf file and configure 
#----    the ServerName option to reference the controller node: 
#cp apache2.conf /etc/apache2/apache2.conf 

#----2. Create the /etc/apache2/sites-available/wsgi-keystone.conf file 
#cp wsgi-keystone.conf /etc/apache2/sites-available/wsgi-keystone.conf

#----3. Enable the Identity service virtual hosts:
ln -s /etc/apache2/sites-available/wsgi-keystone.conf /etc/apache2/sites-enabled

#----4. Create the directory structure for the WSGI components:
#mkdir -p /var/www/cgi-bin/keystone 

#----5. Copy the WSGI components from the upstream repository into this directory:
## curl http://git.openstack.org/cgit/openstack/keystone/plain/httpd/keystone.py?h=stable/kilo \
##  | tee /var/www/cgi-bin/keystone/main /var/www/cgi-bin/keystone/admin

#----6. Adjust ownership and permissions on this directory and the files in it:
#chown -R keystone:keystone /var/www/cgi-bin/keystone
#chmod 755 /var/www/cgi-bin/keystone/*


#----To finalize installation

#----1. Restart the Apache HTTP server:
service apache2 restart

#----2. By default, the Ubuntu packages create a SQLite database.
#---- you can remove the SQLite database file:
rm -f /var/lib/keystone/keystone.db

 
#----2. Edit the /etc/glance/glance-api.conf file 
#cp glance-api.conf /etc/glance/glance-api.conf

#----3.Edit the /etc/glance/glance-registry.conf file
#cp glance-registry.conf /etc/glance/glance-registry.conf

#----4. Populate the Image service database:
#su -s /bin/sh -c "glance-manage db_sync" glance


#---- To finalize installation
#---- 1. Restart the Image service services:
service glance-registry restart
service glance-api restart

#---- 2. By default, the Ubuntu packages create an SQLite database.
rm -f /var/lib/glance/glance.sqlite

#---- 2. Edit the /etc/nova/nova.conf file and complete the following actions:
#cp nova.conf /etc/nova/nova.conf
#chown -R nova /etc/nova/nova.conf
#chgrp -R nova /etc/nova/nova.conf

#----3. Populate the Compute database:
#su -s /bin/sh -c "nova-manage db sync" nova

#----To finalize installation

#----1. Restart the Compute services:
service nova-api restart
service nova-cert restart
service nova-consoleauth restart
service nova-scheduler restart
service nova-conductor restart
service nova-novncproxy restart

#----By default, the Ubuntu packages create an SQLite database.
#----2. Because this configuration uses a SQL database server, 
#       you can remove the SQLite database file:
rm -f /var/lib/nova/nova.sqlite

#----To configure the Networking server component
#---- Edit the /etc/neutron/neutron.conf filefile and complete the following actions:
#cp neutron.conf  /etc/neutron/neutron.conf
#chown -r root /etc/neutron/neutron.conf
#chgrp -R neutron /etc/neutron/neutron.conf

#---- To configure the Modular Layer 2 (ML2) plug-in
#---- Edit the /etc/neutron/plugins/ml2/ml2_conf.ini 
#cp ml2_conf.ini /etc/neutron/plugins/ml2/ml2_conf.ini
#chown -R root /etc/neutron/plugins/ml2/ml2_conf.ini
#chgrp -R neutron /etc/neutron/plugins/ml2/ml2_conf.ini

#---- To configure Compute to use Networking
#---- Edit the /etc/nova/nova.conf file on the controller
#cp  nova.conf   /etc/nova/nova.conf 
#chown -R nova  /etc/nova/nova.conf 
#chgrp -R nova  /etc/nova/nova.conf 

#---- To finalize installation
#-----1.Populate the Network database:
#su -s /bin/sh -c "neutron-db-manage --config-file /etc/neutron/neutron.conf \
#  --config-file /etc/neutron/plugins/ml2/ml2_conf.ini upgrade head" neutron

#----2. Restart the Compute services:
#service nova-api restart

#----3. Restart the Networking service:
service neutron-server restart

#--------To configure the dashboard
#-----To configure the dashboard
#-----Edit the /etc/openstack-dashboard/local_settings.py file
#cp local_settings.py /etc/openstack-dashboard/local_settings.py

#-----To finalize installation
#-----Restart the web server and session storage service:
service apache2 restart

