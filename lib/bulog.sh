#!/bin/bash
if [ $KR_DEBUG == "true" ]; then tynnyri "BULOG"; fi

bulog_latest() {
	#debug BULOG latest $1
	if [ -f $1/backup.log ]; then
		KR_LATEST_BACKUP_LINE=$(tail -n 1 $1/backup.log)
		echo $KR_LATEST_BACKUP_LINE
	else
		touch $1/backup.log
		KR_MD5_ZERO=
		if [ -f $1/backup.log ]; then
			KR_NEW_BACKUP=$(date +"%F %R")
			echo $KR_NEW_BACKUP $2 ver $3 > $1/backup.log
		else
			virhe $1/backup.log cannot exist.
		fi
	fi
}

bulog_add() {
	#debug BULOG add $1 $2 $3
	if [ -f $1/backup.log ]; then
		# make a note in the log of new backup
		KR_NEW_BACKUP=$(date +"%F %R")
		echo $KR_NEW_BACKUP $2 ver $3 >> $1/backup.log
	else
		touch $1/backup.log
		if [ -f $1/backup.log ]; then
			KR_NEW_BACKUP=$(date +"%F %R")
			echo $KR_NEW_BACKUP new ver 0 > $1/backup.log
		else
			virhe $1/backup.log is not a valid file.
		fi
	fi
}