#----Configure Name  resolution
cp hosts /etc/hosts
cp  hostname /etc/hostname

cp interfaces /etc/network/interfaces



#-----Start the NTP service:
#----To configure the NTP service
cp ntp.conf /etc/ntp.conf

#service ntp restart
#=====Database
#-----Restart the database service:
cp  mysqld_openstack.cnf /etc/mysql/conf.d/mysqld_openstack.cnf


#-----
#----3. Edit the /etc/keystone/keystone.conf
cp  keystone.conf /etc/keystone/keystone.conf

#----4. Populate the Identity service database:
#su -s /bin/sh -c "keystone-manage db_sync" keystone

#----To configure the Apache HTTP server
#----1. Edit the /etc/apache2/apache2.conf file and configure 
#----    the ServerName option to reference the controller node: 
cp apache2.conf /etc/apache2/apache2.conf 

#----2. Create the /etc/apache2/sites-available/wsgi-keystone.conf file 
cp wsgi-keystone.conf /etc/apache2/sites-available/wsgi-keystone.conf

#----3. Enable the Identity service virtual hosts:
#ln -s /etc/apache2/sites-available/wsgi-keystone.conf /etc/apache2/sites-enabled

 
#----2. Edit the /etc/glance/glance-api.conf file 
cp glance-api.conf /etc/glance/glance-api.conf

#----3.Edit the /etc/glance/glance-registry.conf file
cp glance-registry.conf /etc/glance/glance-registry.conf


#---- 2. Edit the /etc/nova/nova.conf file and complete the following actions:
cp nova.conf /etc/nova/nova.conf
#chown -R nova /etc/nova/nova.conf
#chgrp -R nova /etc/nova/nova.conf


#----To configure the Networking server component
#---- Edit the /etc/neutron/neutron.conf filefile and complete the following actions:
cp neutron.conf  /etc/neutron/neutron.conf
#chown -r root /etc/neutron/neutron.conf
#chgrp -R neutron /etc/neutron/neutron.conf

#---- To configure the Modular Layer 2 (ML2) plug-in
#---- Edit the /etc/neutron/plugins/ml2/ml2_conf.ini 
cp ml2_conf.ini /etc/neutron/plugins/ml2/ml2_conf.ini
#chown -R root /etc/neutron/plugins/ml2/ml2_conf.ini
#chgrp -R neutron /etc/neutron/plugins/ml2/ml2_conf.ini

 

#---- To finalize installation
#-----1.Populate the Network database:
#su -s /bin/sh -c "neutron-db-manage --config-file /etc/neutron/neutron.conf \
#  --config-file /etc/neutron/plugins/ml2/ml2_conf.ini upgrade head" neutron


#--------To configure the dashboard
#-----To configure the dashboard
#-----Edit the /etc/openstack-dashboard/local_settings.py file
cp local_settings.py /etc/openstack-dashboard/local_settings.py


