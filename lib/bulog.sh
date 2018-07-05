#!/bin/bash
# bulog.sh: functions to manage backup log files.

# returns the last row of the backup log file.
bulog_latest() {
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

# returns the 2nd last row of the backup log file.
bulog_2nd_latest() {
	if [ -f $1/backup.log ]; then
		KRN_2ND_LATEST_LINE=$(tail -n 2 $1/backup.log|head -n 1)
		echo $KRN_2ND_LATEST_LINE
	else
		virhe $1/backup.log "doesn't exist."
	fi
}

# adds a line to the backup log file.
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
			echo $KR_NEW_BACKUP $2 new $3 > $1/backup.log
		else
			virhe $1/backup.log is not a valid file.
		fi
	fi
}

bulog_check_today() {
	# Getting the last row of backup.log and splitting it to retrieve the part of the string for latest backup date.
	BU_LATEST_DATE=$(bulog_latest $1|awk '{print $1}')
	BU_TODAY_DATE=$(date +"%F")
	# Compare the date in latest line of backup.log, if not today, then continue. Doesn't do backup runs if already backed up today (checkup happens in bulog)
	if [ $BU_LATEST_DATE != $BU_TODAY_DATE ]; then
		echo "true"
	else
		echo "false"
	fi
}