#!/bin/bash
#kop.sh, L 27.6.2013/29.6.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri KOP; fi

varko() {
	debug KOP $1 $2
	if [ -d $1 ] && [ $2 != "" ]; then
		# Delete and rename old backups, if they exist.
		if [ -f $KR_DIR_BUT/$2.$USER.$HOSTNAME.old ]; then rm $KR_DIR_BUT/$2.$USER.$HOSTNAME.old; fi
		BU_LATEST_MD5="nada"; BU_TODAY_MD5=md5
		if [ -f $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip ]; then
			case $KAYTTIS in
				cygwin) BU_LATEST_MD5=$(md5sum $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip|awk '{print $1}');;
				darwin) BU_LATEST_MD5=$(md5 $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip|awk '{print $4}');;
			esac
			mv $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip $KR_DIR_BUT/$2.$USER.$HOSTNAME.old
		fi
		# Getting the last row of backup.log
		BU_LATEST_LOGLINE=$(bulog_latest $1)
		# Splitting BU_LATEST_LOGLINE the retrieve the parts of the string for md5 sum and latest backup date.
		BU_LATEST_DATE=$(echo $BU_LATEST_LOGLINE|awk '{print $1}')
		if [ $BU_LATEST_MD5 == "nada" ]; then BU_LATEST_MD5=$(echo $BU_LATEST_LOGLINE|awk '{print $5}'); fi
		BU_TODAY_DATE=$(date +"%F")
		# Compare the date in latest line of backup.log, if not today, then continue.
		if [ $BU_LATEST_DATE != $BU_TODAY_DATE ]; then
			# Creating new zip from the directory without backup.log file
			if [ -f ~/$KR_DIR_INCL/$2.lst ]; then
				zip -qr $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip $1 -i@~/$KR_DIR_INCL/$2.lst
				debug zip -qr $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip $1 -i@~/$KR_DIR_INCL/$2.lst
			else
				zip -qr $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip $1 -x@$HOME/$KR_DIR_EXCL/default.lst -x *backup.log*
			fi
			if [ -f $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip ]; then
				case $KAYTTIS in
					cygwin) BU_TODAY_MD5=$(md5sum $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip|awk '{print $1}');;
					darwin) BU_TODAY_MD5=$(md5 $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip|awk '{print $4}');;
				esac
			fi
			# Checking if md5 sum is the same between the latest backup in backup.log and current backup. If not, continue.
			if [ $BU_LATEST_MD5 != $BU_TODAY_MD5 ]; then
				kaiku $BU_LATEST_DATE "LvT" $BU_TODAY_DATE $2
				# Update the backup.log file and copy it to the backup.logs directory.
				bulog_add $1 $2 $BU_TODAY_MD5
				cp $1/backup.log $KR_DIR_LOGS/$2.log
				# Create new encrypted file from the created zip file.
				if [ -f $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip ]; then gpg --encrypt -r $RECIPIENT $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip; fi
			fi
			# Removing the created zip file.
			if [ -f $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip ]; then rm $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip; fi
			# Moving the created gpg file to the backup directory.
			if [ -f $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip.gpg ]; then mv $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip.gpg $KR_DIR_BUC/$2.cbc; fi
		else
			debug varko.sh:52 $BU_LATEST_DATE vs. $BU_TODAY_DATE
		fi
	else
		virhe KOP "Arguments " $1 $2 "not valid!"
	fi
}
