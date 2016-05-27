#!/bin/bash
#kop.sh, L 27.6.2013/29.6.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri KOP; fi

xvarko() {
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
	if [ -d $1 ] && [ $ != "" ]; then
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
	if [ -d $1 ] && [ $ != "" ]; then
		debug KOP $1 $2
		# Checking the last row of backup.log (tail / bulog_latest)
		# LATEST_TODAY=$(bulog_latest $BULOG_POLKU)
		# Splitting LATEST_TODAY the retrieve the parts of the string. päivä/aika, md5 sum, kohde
		# LATEST_MD5=(awk LATEST_TODAY)
		# LATEST_DATE=(awk LATEST_TODAY)
		# LATEST_DATE=(awk LATEST_TODAY)
		#3. Vrt. Onko backup.log viimeisin päivä sama kuin tänään, jos on lopeta varko (if-then-else)
		#4. Luo uusi zip hakemiston sisällöstä (ilman backup.log -tiedostoa)
		#5. Tarkista onko luodun zip-tiedoston md5 sama kuin backup.log tiedoston viimeisimmällä rivillä
		#6. Jos on, keskeytä, muutoin jatka (if-then-else)
		#7. Päivitä backup.log tiedosto ja Kopioi backup.log tiedosto backup.logs -hakemistoon zip-tiedoston nimellä (kaikille vs vain jos uusi cbc?)
		#8. Luo uusi kryptotiedosto (gpg) luodusta zip tiedostosta
		#9. Poista luotu zip-tiedosto
		# rm BUPATH/HOSTNAME.USER.zip
		#10. Siirrä luotu gpg oC / talentless-backups -hekmistoon ja muuta tiedosto pääte muotoon .cbc  
	else
		virhe KOP "Arguments " $1 $2 "not valid!"
	fi
}
