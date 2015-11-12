source comm.sh


#----To install the Object Storage controller  components

#----1. Install the packages:
apt-get install swift swift-proxy python-swiftclient python-keystoneclient \
  python-keystonemiddleware memcached -y

#----2. Create the /etc/swift directory.
mkdir /etc/swift

#----3. Obtain the proxy service configuration file from the Object Storage source repository:
curl -o /etc/swift/proxy-server.conf \
  https://git.openstack.org/cgit/openstack/swift/plain/etc/proxy-server.conf-sample?h=stable/kilo
  

  
#---backup configuration
cp  /etc/swift/proxy-server.conf  $OETC_DIR/proxy-server.conf

#---- 4. Edit the /etc/swift/proxy-server.conf file and complete the following actions:
cp   proxy-server.conf /etc/swift/proxy-server.conf
#chown -r root /etc/swift/proxy-server.conf 
#chgrp -R root /etc/swift/proxy-server.conf 


