#!/bin/bash
#bulog.sh, L 27.2.2015
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri "BULOG"; fi

bulog() {
	if [ -d $1 ]; then
		#if [ -f $1/backup.log ]; then touch $1/backup.log; fi
		echo DIR $1 TO $2 FROM $3
	} else {
		echo "$1 NOT A DIRECTORY!"
	}
}






