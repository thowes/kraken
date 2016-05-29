#!/bin/bash
#kop.sh, L 27.6.2013/29.6.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri KOP; fi

xvarko() {
	if [ -d $1 ] && [ $2 != "" ]; then
		debug KOP $1 $2
		KR_LATEST_TODAY="today_maybe"
		# add a comment to backup.log
		bulog $1 $2.zip original_dir
		debug KOP $KR_LATEST_TODAY
		# doesn't do backup runs if already backed up today (checkup happens in bulog)
		if [ $KR_LATEST_TODAY == "today_false" ]; then
			if [ -f $KR_DIR_BUT/$2.$USER.$HOSTNAME.old ]; then rm $KR_DIR_BUT/$2.$USER.$HOSTNAME.old; fi
			# collect md5 checksums of old backup
			KR_MD5_OLD=$(md5sum $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip)
			if [ -f $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip ]; then mv $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip $KR_DIR_BUT/$2.$USER.$HOSTNAME.old; fi
			if [ -f ~/$KR_DIR_EXCL/$2.lst ]; then
				zip -qr $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip $1 -x@$HOME/$KR_DIR_EXCL/$2.lst -x *backup.log*
			else
				zip -qr $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip $1 -x@$HOME/$KR_DIR_EXCL/default.lst -x *backup.log*
			fi
			# collect md5 checksums of new and comparing it to old
			KR_MD5_NEW=$(md5sum $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip)
			if [ "$KR_MD5_OLD" != "$KR_MD5_NEW" ]; then
				# encrypting the backup file
				gpg --encrypt -r $RECIPIENT $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip
				mv $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip.gpg $KR_DIR_BUC/$2.$USER.$HOSTNAME.cbc
				tynnyri $2
			fi
			if [ -f $KR_DIR_BUT/$2.$USER.$HOSTNAME.old ]; then rm $KR_DIR_BUT/$2.$USER.$HOSTNAME.old; fi
		else
			debug KOP $2
		fi
	else
		virhe KOP "Parametrit" $1 $2 "eivät kelpaa!"
	fi
}

varko() {
	if [ -d $1 ] && [ $2 != "" ]; then
		debug KOP $1 $2
		KR_LATEST_TODAY="today_maybe"
		# add a comment to backup.log
		bulog $1 $2.zip original_dir
		debug KOP $KR_LATEST_TODAY
		# doesn't do backup runs if already backed up today (checkup happens in bulog)
		if [ $KR_LATEST_TODAY == "today_false" ]; then
			if [ -f $KR_DIR_BUT/$2.$USER.$HOSTNAME.old ]; then rm $KR_DIR_BUT/$2.$USER.$HOSTNAME.old; fi
			# collect md5 checksums of old backup (default is "nada", in case old backup does not exist.)
			KR_MD5_OLD="nada"
			if [ -f $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip ]; then 
				KR_MD5_OLD=$(md5sum $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip); fi
			# move the old backup file .old file
			if [ -f $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip ]; then mv $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip $KR_DIR_BUT/$2.$USER.$HOSTNAME.old; fi
			if [ -f ~/$KR_DIR_EXCL/$2.lst ]; then
				zip -qr $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip $1 -x@$HOME/$KR_DIR_EXCL/$2.lst -x *backup.log*
			else
				zip -qr $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip $1 -x@$HOME/$KR_DIR_EXCL/default.lst -x *backup.log*
			fi
			# collect md5 checksums of new and comparing it to old (defualt in case there is no file) 
			KR_MD5_NEW="ei mit"
			if [ -f $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip ]; then KR_MD5_NEW=$(md5sum $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip); fi
			if [ "$KR_MD5_OLD" != "$KR_MD5_NEW" ]; then
				# encrypting the backup file
				gpg --encrypt -r $RECIPIENT $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip
				mv $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip.gpg $KR_DIR_BUC/$2.$USER.$HOSTNAME.cbc
				tynnyri $2
			fi
			if [ -f $KR_DIR_BUT/$2.$USER.$HOSTNAME.old ]; then rm $KR_DIR_BUT/$2.$USER.$HOSTNAME.old; fi
		else
			debug KOP $2
		fi
	else
		virhe KOP "Parametrit" $1 $2 "eivät kelpaa!"
	fi
}

varko_new() {
	debug KOP $1 $2
	if [ -d $1 ] && [ $2 != "" ]; then
		# Delete and rename old backups, if they exist.
		if [ -f $KR_DIR_BUT/$2.$USER.$HOSTNAME.old ]; then rm $KR_DIR_BUT/$2.$USER.$HOSTNAME.old; fi
		BU_LATEST_MD5="nada"
		if [ -f $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip ]; then
			BU_TODAY_MD5=$(md5sum $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip|awk '{print $1}')
			mv $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip $KR_DIR_BUT/$2.$USER.$HOSTNAME.old
		fi
		# Getting the last row of backup.log
		BU_LATEST_LOGLINE=$(bulog_latest $1)
		# Splitting BU_LATEST_LOGLINE the retrieve the parts of the string for md5 sum and latest backup date.
		BU_LATEST_DATE=$(echo $BU_LATEST_LOGLINE|awk '{print $1}')
		#BU_LATEST_MD5=$(echo $BU_LATEST_LOGLINE|awk '{print $7}')
		BU_TODAY_DATE=$(date +"%F")
		# Compare the date in latest line of backup.log, if not today, then continue.
		if [ $BU_LATEST_DATE != $BU_TODAY_DATE ]; then
			# Creating new zip from the directory without backup.log file
			if [ -f ~/$KR_DIR_EXCL/$2.lst ]; then
				zip -qr $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip $1 -x@$HOME/$KR_DIR_EXCL/$2.lst -x *backup.log*
			else
				zip -qr $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip $1 -x@$HOME/$KR_DIR_EXCL/default.lst -x *backup.log*
			fi
			if [ -f $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip ]; then BU_TODAY_MD5=$(md5sum $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip|awk '{print $1}'); fi
			# Checking if md5 sum is the same between the latest backup in backup.log and current backup. If not, continue.
			echo $BU_LATEST_MD5 vs. $BU_TODAY_MD5
			#7. Päivitä backup.log tiedosto ja Kopioi backup.log tiedosto backup.logs -hakemistoon zip-tiedoston nimellä (kaikille vs vain jos uusi cbc?)
			#8. Luo uusi kryptotiedosto (gpg) luodusta zip tiedostosta
			#9. Poista luotu zip-tiedosto
			# rm BUPATH/HOSTNAME.USER.zip
			#10. Siirrä luotu gpg oC / talentless-backups -hekmistoon ja muuta tiedosto pääte muotoon .cbc
		else
			echo $BU_LATEST_DATE vs. $BU_TODAY_DATE and $BU_LATEST_MD5
		fi
	else
		virhe KOP "Arguments " $1 $2 "not valid!"
	fi
}
