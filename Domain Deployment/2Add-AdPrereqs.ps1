# AddAdPrereqs.ps1 
#set static IP address 
$ipaddress = "172.17.122.11" 
$ipprefix = "24" 
$ipgw = "172.17.122.1" 
$ipdns = "172.17.122.11" 
$ipif = (Get-NetAdapter).ifIndex 
New-NetIPAddress -IPAddress $ipaddress -PrefixLength $ipprefix -InterfaceIndex $ipif -DefaultGateway $ipgw 
#rename the computer 
$newname = "dc1" 
Rename-Computer -NewName $newname -force 
#install features 
$featureLogPath = "c:\poshlog\featurelog.txt" 
New-Item $featureLogPath -ItemType file -Force 
$addsTools = "RSAT-AD-Tools" 
Add-WindowsFeature $addsTools 
Get-WindowsFeature | Where installed >>$featureLogPath 
#restart the computer 
# Restart-Computer