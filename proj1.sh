#!/bin/bash

RECURSIVE_DIS(){
echo "<ul>" >> $1
for filename in $(ls)
	do
		if test -f $filename
		then
			echo "<li>$filename</li>" >> $1
		else
			echo "<li>$filename" >> $1
			cd $filename
			RECURSIVE_DIS $1
			cd ..
			echo "</li>" >> $1
		fi
	done
echo "</ul>" >> $1
}

#----------MAIN----------
if [ $# != 2 ]
then
	echo "INPUT ERROR: incorrect number of arguments! "
	exit 1
else
	i=`pwd`
	des=${i}"/"${2}
	cd $1
	i=`pwd`
	RECURSIVE_DIS $des
	cd $i
fi
