#----Verify operation Image

#----2. Source the admin credentials to gain access to admin-only CLI commands:
#-----$ source admin-openrc.sh
#export OS_PROJECT_DOMAIN_ID=default
#export OS_USER_DOMAIN_ID=default
#export OS_PROJECT_NAME=admin
#export OS_TENANT_NAME=admin
#export OS_USERNAME=admin
#export OS_PASSWORD=ppooiiuu
#export OS_AUTH_URL=http://controller:35357/v3
#export OS_IMAGE_API_VERSION=2

source admin-openrc.sh

#----3. Create a temporary local directory:
mkdir /tmp/images

#----4. Download the source image into it:
wget -P /tmp/images http://download.cirros-cloud.net/0.3.4/cirros-0.3.4-x86_64-disk.img

#-----5. Upload the image to the Image service using the QCOW2 disk format, bare container format,
#        and public visibility so all projects can access it:
glance image-create --name "cirros-0.3.4-x86_64" --file /tmp/images/cirros-0.3.4-x86_64-disk.img \
  --disk-format qcow2 --container-format bare --visibility public --progress
 
#---4.a To load i386 imag by JCYU 
wget -P /tmp/images http://download.cirros-cloud.net/0.3.4/cirros-0.3.4-i386-disk.img

glance image-create --name "cirros-0.3.4-i386" --file /tmp/images/cirros-0.3.4-i386-disk.img \
  --disk-format qcow2 --container-format bare --visibility public --progress 

 
#-----6. Confirm upload of the image and validate attributes:
glance image-list


#----7. Remove the temporary local directory and source image:
rm -r /tmp/images




