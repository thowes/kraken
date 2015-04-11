#!/bin/bash
#val.sh, L 11.6.2013/20.7.2014
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri VAL; fi

valitse() {
	#prints to screen list projects valid for current location
	cat ~/$KR_DIR_HOST/proj.csv|grep $1|awk -F, '{ print " "$1"\t" $2 }'
	KR_PROJ="def"
	read -p "PROJECT " -r KR_PROJ
	if [ $KR_PROJ != "" ]; then PROJECT=$KR_PROJ; else virhe PROJ $KR_PROJ; fi
}
