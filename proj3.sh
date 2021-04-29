#!/bin/bash
while [ 0 -lt 1 ]
do
echo "1. Operating system info"
echo "2. Hostname and DNS info"
echo "3. Network info"
echo "4. Who is online"
echo "5. Last logged in users"
echo "6. My IP address"
echo "7. My disk usage"
echo "8. My home file-tree"
echo "9. Process operations"
echo "10.Exit"
echo -n "Enter your choice [ 1 - 10 ] "
read opt
case $opt in
	"1")
		echo "--------------------------------------------------"
		echo " System information"
		echo "--------------------------------------------------"
		echo "Operating system:Linux"
		/usr/bin/lsb_release -a
		;;
	"2")
		echo "--------------------------------------------------"
		echo " Hostname and DNS information"
		echo "--------------------------------------------------"
		echo -n "Hostname : "
		hostname
		echo -n "DNS domain : "
		dnsdomainname
		echo -n "Fully qualified domain name : "
		hostname --fqdn
		echo -n "Network address (IP) : "
		#dig | grep SERVER | awk '{print $3}'
		#cat /etc/resolv.conf | grep nameserver | awk '{print $2}'
		ifconfig | grep "inet " | awk '{print $2}' | grep -v "127.0.0.1"
		echo -n "DNS name servers (DNS IP) : "
		cat /etc/resolv.conf | grep nameserver | awk '{print $2}'
		echo ""
		;;
	"3")
		echo "--------------------------------------------------"
		echo " Network information"
		echo "--------------------------------------------------"
		echo -n "Total network interfaces found : "
		#echo ifconfig | grep "flags" | wc -l | awk '{print ($1 -1)}'
		ip link show | wc -l | awk '{print ($1/2-1)}'
		ip link show
		echo "***********************"
		echo "*** Network Routing ***"
		echo "***********************"
		netstat -r
		echo "*************************************"
		echo "*** Interface traffic information ***"
		echo "*************************************"
		netstat -i
		;;
	"4")
		echo "--------------------------------------------------"
		echo " Who is online"
		echo "--------------------------------------------------"
		who -H
		;;
	"5")
		echo "--------------------------------------------------"
		echo " List of last logged in users"
		echo "--------------------------------------------------"
		lastlog | grep -v "**Never logged in**"
		last | tail -n 2
		;;
	"6")
		echo "--------------------------------------------------"
		echo " Public IP Information"
		echo "--------------------------------------------------"
		ifconfig | grep "inet " | awk '{print $2}' | grep -v "127.0.0.1"
		;;
	"7")
		echo "--------------------------------------------------"
		echo " Disk Usage Info"
		echo "--------------------------------------------------"
		df -h | awk 'NR==1 {next} {print $5, " ", $6}'
		;;
	"8")
		echo "--------------------------------------------------"
		echo " Home file tree"
		echo "--------------------------------------------------"
		chmod 777 ./proj1.sh
		./proj1.sh /home/ filetree.html
		echo " Home file tree has been successfully created! "
		;;
	"9")
		chmod 777 ./proc.sh
		./proc.sh
		;;
	"10")
		break 2
		;;
	*)
		echo "INPUT ERROR!"
		;;
esac
echo -n "Press [Enter] key to continue..."
read en
done
