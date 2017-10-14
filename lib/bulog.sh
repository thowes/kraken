#!/bin/bash
#bulog.sh, L 27.2.2015
if [ $KR_DEBUG == "true" ]; then tynnyri "BULOG"; fi

bulog() {
	KR_LATEST_TODAY="today_false"
	if [ -d $1 ]; then
		if [ -f $1/backup.log ]; then debug BULOG CR; else touch $1/backup.log; fi
		KR_TODAY=$(date +"%F")
		KR_LATEST_BACKUP_LINE=$(tail -n 1 $1/backup.log)
		KR_LATEST_BACKUP_DATE=$(echo $KR_LATEST_BACKUP_LINE|awk '{print $1}')
		#debug BULOG 12 $KR_LATEST_BACKUP_DATE $KR_TODAY
		#if already backed up today, saving that to LATEST_TODAY
		if [ $KR_LATEST_BACKUP_DATE == $KR_TODAY ]; then
			KR_LATEST_TODAY="today_true"
			#debug BULOG 16 true
		else
			# if not backed up already today, then make a note in the log of new backup
			KR_NEW_BACKUP=$(date +"%F %R")
			echo $KR_NEW_BACKUP TO $2 FROM $3 >> $1/backup.log
			#debug BULOG 21 false
		fi
	fi
	debug BULOG 24 $KR_LATEST_TODAY
}

bulog_latest() {
	#debug BULOG latest $1
	if [ -f $1/backup.log ]; then
		KR_LATEST_BACKUP_LINE=$(tail -n 1 $1/backup.log)
		echo $KR_LATEST_BACKUP_LINE
	else
		touch $1/backup.log
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
			echo $KR_NEW_BACKUP $2 ver $3 > $1/backup.log
		else
			virhe $1/backup.log is not a valid file.
		fi
	fi
}