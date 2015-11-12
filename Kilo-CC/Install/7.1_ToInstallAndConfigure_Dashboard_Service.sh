source comm.sh

#-----Install the dashboard components
#-----Install the packages:
apt-get install openstack-dashboard -y

#---backup configuration
cp  /etc/openstack-dashboard/local_settings.py $OETC_DIR/local_settings.py


#-----To configure the dashboard
#-----Edit the /etc/openstack-dashboard/local_settings.py file
cp local_settings.py /etc/openstack-dashboard/local_settings.py

#-----To finalize installation
#-----Restart the web server and session storage service:
#service apache2 restart
service apache2 reload
#WaitForAnyKey "Neutron service components installed!!"

