#!/bin/bash
#bulog.sh, L 27.2.2015
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri "BULOG"; fi

bulog() {
	if [ -d $1 ]; then
		if [ -f $1/backup.log ]; then debug BULOG CR; else touch $1/backup.log; fi
		KR_AIKA=$(date +"%F %R")
		echo $KR_AIKA TO $2 FROM $3 >> $1/backup.log
		if [ -f $1/backup.log ]; then tail -n 1 $1/backup.log; fi
	fi
}
