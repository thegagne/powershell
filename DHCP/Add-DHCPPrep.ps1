#Create DHCP Scope
Add-DhcpServerInDC -DnsName dc1.lab1.ihopkc.org -IPAddress 172.17.122.11
Add-DhcpServerv4Scope -StartRange 172.17.122.101 -EndRange 172.17.122.199 -SubnetMask 255.255.255.0 -Name "Lab1" -Description "Lab1 DHCP Pool" 
Set-DhcpServerv4OptionValue -Router 172.17.122.1 -DnsServer 172.17.122.11
