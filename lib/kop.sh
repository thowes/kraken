#!/bin/bash
#kop.sh, L 27.6.2013/29.6.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri KOP; fi

kopioi() {
	varko $1 $2
}

varko() {
	if [ -d $1 ] && [ $ != "" ]; then
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
			zip -qr $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip $1 -x *backup.log*
			# collect md5 checksums of new and comparing it to old
			KR_MD5_NEW=$(md5sum $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip)
			if [ "$KR_MD5_OLD" == "$KR_MD5_NEW" ]; then
				echo YES $2
			else echo NO $2; fi
			#echo "O:" $KR_MD5_OLD
			#echo "N:" $KR_MD5_NEW
			# encrypting the backup file
			gpg --encrypt -a -r $RECIPIENT $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip
			mv $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip.asc $KR_DIR_BUC/$2.$USER.$HOSTNAME.cbc
		else
			debug KOP $2
		fi
	else
		virhe KOP "Parametrit" $1 $2 "eivät kelpaa!"
	fi
}