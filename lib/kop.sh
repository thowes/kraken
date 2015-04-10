#!/bin/bash
#kop.sh, L 27.6.2013/29.6.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri KOP; fi

kopioi() {
	if [ -d $1 ] && [ $ != "" ]; then
		#if [ -f $1/backup.log ]; then tail -n 1 $1/backup.log; fi
		bulog $1 $2.zip original_dir
		mv $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip $KR_DIR_BUT/$2.$USER.$HOSTNAME.old
		zip -qr $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip $1
		#gpg
	else
		virhe KOP "Parametrit" $1 $2 "eivät kelpaa!"
	fi
}
