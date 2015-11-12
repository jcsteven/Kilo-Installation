source comm.sh

#-----To install and configure the Compute hypervisor components
#-----1.Install the packages
apt-get install nova-compute sysfsutils -y

#---backup configuration
cp  /etc/nova/nova.conf  $OETC_DIR/nova.conf
cp /etc/nova/nova-compute.conf $OETC_DIR/nova-compute.conf 




#-----2.Edit the /etc/nova/nova.conf file and complete the following actions:
cp  nova.conf /etc/nova/nova.conf
#chown -R nova /etc/nova/nova.conf
#chgrp -R nova /etc/nova/nova.conf

#-----To finalize installation
#-----1. Determine whether your compute node supports hardware acceleration 
#-----   for virtual machines:
#egrep -c '(vmx|svm)' /proc/cpuinfo

#echo "==>If this command returns a value of zero," 
#echo "your compute node does not support hardware acceleration"
#echo " and you must configure libvirt to use QEMU instead of KVM."
#echo "==> You need to modify in the file /etc/nova/nova-compute"
#echo "   0: virt_type = qemu  or other virt_type = kvm   ".

#-----Edit the [libvirt] section in the /etc/nova/nova-compute.conf file
cp nova-compute.conf /etc/nova/nova-compute.conf

#-----2. Restart the Compute service:
service nova-compute restart

#-----3. you can remove the SQLite database file:
rm -f /var/lib/nova/nova.sqlite



