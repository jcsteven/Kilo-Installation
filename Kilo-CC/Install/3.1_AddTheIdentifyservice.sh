source comm.sh


#----To install and configure the Identity service components
#----1. Disable the keystone service from starting automatically 
#----   after installation
echo "manual" > /etc/init/keystone.override


#----2.Run the following command to install the packages:
apt-get install keystone python-openstackclient apache2 libapache2-mod-wsgi -y
apt-get install  memcached python-memcache -y


#---backup configuration
cp  /etc/keystone/keystone.conf  $OETC_DIR/keystone.conf
cp  /etc/keystone/keystone-paste.ini  $OETC_DIR/keystone-paste.ini
cp  /etc/apache2/apache2.conf   $OETC_DIR/apache2.conf

#cp  /etc/apache2/sites-available/wsgi-keystone.conf $OETC_DIR/wsgi-keystone.conf
 
 
#----3. Edit the /etc/keystone/keystone.conf
cp   keystone.conf /etc/keystone/keystone.conf

#----4. Populate the Identity service database:
su -s /bin/sh -c "keystone-manage db_sync" keystone



#----To configure the Apache HTTP server
#----1. Edit the /etc/apache2/apache2.conf file and configure 
#----    the ServerName option to reference the controller node: 
cp apache2.conf /etc/apache2/apache2.conf 

#----2. Create the /etc/apache2/sites-available/wsgi-keystone.conf file 
cp wsgi-keystone.conf /etc/apache2/sites-available/wsgi-keystone.conf

#----3. Enable the Identity service virtual hosts:
ln -s /etc/apache2/sites-available/wsgi-keystone.conf /etc/apache2/sites-enabled


#----4. Create the directory structure for the WSGI components:

mkdir -p /var/www/cgi-bin/keystone 

#----5. Copy the WSGI components from the upstream repository into this directory:
curl http://git.openstack.org/cgit/openstack/keystone/plain/httpd/keystone.py?h=stable/kilo \
  | tee /var/www/cgi-bin/keystone/main /var/www/cgi-bin/keystone/admin

#----6. Adjust ownership and permissions on this directory and the files in it:
chown -R keystone:keystone /var/www/cgi-bin/keystone
chmod 755 /var/www/cgi-bin/keystone/*

#WaitForAnyKey "Identity service components installed!!"
#----To finalize installation

#----1. Restart the Apache HTTP server:
service apache2 restart

#----2. By default, the Ubuntu packages create a SQLite database.
#---- you can remove the SQLite database file:
rm -f /var/lib/keystone/keystone.db

