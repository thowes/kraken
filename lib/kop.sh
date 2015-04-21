#!/bin/bash
#kop.sh, L 27.6.2013/29.6.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri KOP; fi

kopioi() {
	if [ -d $1 ] && [ $ != "" ]; then
		debug KOP $1 $2
		KR_LATEST_TODAY="today_maybe"
		bulog $1 $2.zip original_dir
		debug KOP $KR_LATEST_TODAY
		#doesn't do backup runs if already backed up today (checkup happens in bulog)
		if [ $KR_LATEST_TODAY == "today_false" ]; then
			mv $KR_DIR_BUT/$2.$USER.$HOSTNAME.gpg $KR_DIR_BUT/$2.$USER.$HOSTNAME.g0
			mv $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip $KR_DIR_BUT/$2.$USER.$HOSTNAME.z0
			zip -qr $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip $1
			gpg --encrypt -a -r $RECIPIENT $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip
			cp $KR_DIR_BUT/$2.$USER.$HOSTNAME.gpg $KR_DIR_BUC/$2.$USER.$HOSTNAME.cbc
		else
			debug KOP $2
		fi
	else
		virhe KOP "Parametrit" $1 $2 "eivät kelpaa!"
	fi
}
