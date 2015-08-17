#!/bin/bash
#bulog.sh, L 27.2.2015
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri "BULOG"; fi

bulog() {
	KR_LATEST_TODAY="today_false"
	if [ -d $1 ]; then
		if [ -f $1/backup.log ]; then debug BULOG CR; else touch $1/backup.log; fi
		KR_TODAY=$(date +"%F")
		KR_LATEST_BACKUP_LINE=$(tail -n 1 $1/backup.log)
		KR_LATEST_BACKUP_DATE=$(echo $KR_LATEST_BACKUP_LINE|awk '{print $1}')
		debug BULOG 12 $KR_LATEST_BACKUP_DATE $KR_TODAY
		#if already backed up today, saving that to LATEST_TODAY
		if [ $KR_LATEST_BACKUP_DATE == $KR_TODAY ]; then
			KR_LATEST_TODAY="today_true"
			debug BULOG 16 true
		else
			# if not backed up already today, then make a note in the log of new backup
			KR_NEW_BACKUP=$(date +"%F %R")
			echo $KR_NEW_BACKUP TO $2 FROM $3 >> $1/backup.log
			debug BULOG 21 false
		fi
	fi
	debug BULOG 24 $KR_LATEST_TODAY
}

bulog_latest() {
	debug BULOG latest
}

bulog_add() {
	debug BULOG add
}