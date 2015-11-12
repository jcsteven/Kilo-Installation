#----Depending on your network interface driver, 
#    you may need to disable generic receive offload (GRO) 
#    to achieve suitable throughput between your instances 
#     and the external network.

#    To temporarily disable GRO on the external network interface 
#    while testing your environment:
ethtool -K eth0 gro off









