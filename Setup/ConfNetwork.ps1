# Set static IP address 
$ipaddress = "172.17.122.21" 
$ipprefix = "24" 
$ipgw = "172.17.122.1" 
$ipdns = "172.17.122.11" 
$ipif = (Get-NetAdapter).ifIndex 
New-NetIPAddress -IPAddress $ipaddress -PrefixLength $ipprefix -InterfaceIndex $ipif -DefaultGateway $ipgw 
# Rename the computer 
$newname = "core1" 
Rename-Computer -NewName $newname -force 
# Restart
Restart
