#!/bin/bash
while [ 0 -lt 1 ]
do
echo "Please enter the number of your selection below"
echo ""
echo "1. Show all processes"
echo "2. Kill a process"
echo "3. Bring up top"
echo "4. Return to the main menu"
echo ""
read opt
case $opt in
	"1")
		ps -f
		;;
	"2")
		echo "Please enter the PID of the process yoou would like to kill"
		read pidd
		kill $pidd
		;;
	"3")
		top
		;;
	"4")
		break 2
		;;
	*)
		echo "INPUT ERROR"
		;;
esac
echo -n "Press [Enter] key to continue..."
read en
done
