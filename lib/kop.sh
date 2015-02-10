#!/bin/bash
#kop.sh, L 27.6.2013/29.6.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri KOP; fi

kopioi() {
	if [ -d $1 ] && [ $ != "" ]; then
		mv $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip $KR_DIR_BUT/$2.$USER.$HOSTNAME.old
		zip -qr $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip $1
		#gpg --output $KR_DIR_BUC/$2.$USER.$HOSTNAME.gpg --encrypt --recipient thw@iki.fi $KR_DIR_BUT/$2.$USER.$HOSTNAME.zip
	else
		virhe KOP "Parametrit" $1 $2 "eivät kelpaa!"
	fi
}