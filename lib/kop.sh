#!/bin/bash
if [ $KR_DEBUG == "true" ]; then tynnyri KOP; fi

varko() {
	if [ -d $1 ] && [ $2 != "" ]; then
		# Delete and rename old backups, if they exist.
		if [ -f $KR_DIR_TEMP/$2.$USER.$HOSTNAME.old ]; then rm $KR_DIR_TEMP/$2.$USER.$HOSTNAME.old; fi
		BU_LATEST_MD5="nada"; BU_TODAY_MD5=md5
		if [ -f $KR_DIR_TEMP/$2.$USER.$HOSTNAME.zip ]; then
			case $KAYTTIS in
				darwin) BU_LATEST_MD5=$(md5 $KR_DIR_TEMP/$2.$USER.$HOSTNAME.zip|awk '{print $4}');;
				*) BU_LATEST_MD5=$(md5sum $KR_DIR_TEMP/$2.$USER.$HOSTNAME.zip|awk '{print $1}');;
			esac
			mv $KR_DIR_TEMP/$2.$USER.$HOSTNAME.zip $KR_DIR_TEMP/$2.$USER.$HOSTNAME.old
		fi
		# Getting the last row of backup.log
		BU_LATEST_LOGLINE=$(bulog_latest $1)
		# Splitting BU_LATEST_LOGLINE the retrieve the parts of the string for md5 sum and latest backup date.
		BU_LATEST_DATE=$(echo $BU_LATEST_LOGLINE|awk '{print $1}')
		if [ $BU_LATEST_MD5 == "nada" ]; then BU_LATEST_MD5=$(echo $BU_LATEST_LOGLINE|awk '{print $5}'); fi
		BU_TODAY_DATE=$(date +"%F")
		# Compare the date in latest line of backup.log, if not today, then continue.
		if [ $BU_LATEST_DATE != $BU_TODAY_DATE ]; then
			debug "kop.sh:25c" $2 "L:$BU_LATEST_DATE" "T:$BU_TODAY_DATE"
			# Creating new zip from the directory without backup.log file
			if [ -f $KR_DIR_INCL/$2.lst ]; then
				zip -qr $KR_DIR_TEMP/$2.$USER.$HOSTNAME.zip $1 -i@$KR_DIR_INCL/$2.lst
			else
				case $KAYTTIS in
					cygwin) zip -qr $KR_DIR_TEMP/$2.$USER.$HOSTNAME.zip $1 -x@$KR_DIR_EXCL/default.lst -x *backup.log* -x *Thumbs.db*;;
					darwin) zip -qr $KR_DIR_TEMP/$2.$USER.$HOSTNAME.zip $1 -x@$KR_DIR_EXCL/default.lst -x *backup.log* -x "*.DS_Store";;
					*) zip -qr $KR_DIR_TEMP/$2.$USER.$HOSTNAME.zip $1 -x@$KR_DIR_EXCL/default.lst -x *backup.log* -x *Thumbs.db* -x "*.DS_Store";;
				esac
			fi
			if [ -f $KR_DIR_TEMP/$2.$USER.$HOSTNAME.zip ]; then
				case $KAYTTIS in
					darwin) BU_TODAY_MD5=$(md5 $KR_DIR_TEMP/$2.$USER.$HOSTNAME.zip|awk '{print $4}');;
					*) BU_TODAY_MD5=$(md5sum $KR_DIR_TEMP/$2.$USER.$HOSTNAME.zip|awk '{print $1}');;
				esac
			fi
			# Checking if md5 sum is the same between the latest backup in backup.log and current backup. If not, continue.
			if [ "$BU_LATEST_MD5" != "$BU_TODAY_MD5" ]; then
				# Create new encrypted file from the created zip file.
				if [ -f $KR_DIR_TEMP/$2.$USER.$HOSTNAME.zip ]; then
					debug "$BU_LATEST_MD5" "v" "$BU_TODAY_MD5"
					gpg --encrypt -r $KR_RECIPIENT $KR_DIR_TEMP/$2.$USER.$HOSTNAME.zip
				fi
			else debug "kop.sh:52nc" $2 "L:$BU_LATEST_MD5" "T:$BU_TODAY_MD5"
			fi
			# Removing the created zip file.
			if [ -f $KR_DIR_TEMP/$2.$USER.$HOSTNAME.zip ]; then \rm $KR_DIR_TEMP/$2.$USER.$HOSTNAME.zip; fi
			# Moving the created gpg file to the backup directory.
			if [ -f $KR_DIR_TEMP/$2.$USER.$HOSTNAME.zip.gpg ]; then tynnyri $2
				# Update the backup.log file and copy it to the backup.logs directory.
				bulog_add $1 $2 $BU_TODAY_MD5
				\cp $1/backup.log $KR_DIR_LOGS/$2.log
				\mv $KR_DIR_TEMP/$2.$USER.$HOSTNAME.zip.gpg $KR_DIR_BUC/$2.cbc
			fi
		else
			debug "kop.sh:59nc" $2 "L:$BU_LATEST_DATE" "T:$BU_TODAY_DATE"
		fi
	else
		virhe KOP "Arguments " $1 $2 "not valid!"
	fi
}
