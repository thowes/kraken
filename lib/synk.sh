#!/bin/bash
if [ $KR_DEBUG == "true" ]; then tynnyri SYNK; fi

synk_real() {
	if [ -f $KR_DIR_SITES/$2 ]; then . $KR_DIR_SITES/$2
		kaiku SYNK real $1 $2
		case $1 in
			ssh) ssh $SYNK_USERNAME"@"$SYNK_HOSTNAME;;
			syn) if [ -d $SYNK_LDIR ]; then if [ -f $KR_DIR_EXCL/$2 ]; then
					# Getting the last row of backup.log and splitting it to retrieve the part of the string for latest backup date.
					BU_LATEST_DATE=$(bulog_latest $SYNK_LDIR|awk '{print $1}')
					BU_TODAY_DATE=$(date +"%F")
					# Compare the date in latest line of backup.log, if not today, then continue.
					#doesn't do backup runs if already backed up today (checkup happens in bulog)
					if [ $BU_LATEST_DATE != $BU_TODAY_DATE ]; then
						bulog_add $SYNK_LDIR $SYNK_HOSTNAME $HOSTNAME
						rsync $SYNK_PARAM $SYNK_USERNAME@$SYNK_HOSTNAME:$SYNK_DDIR $SYNK_LDIR --exclude-from $KR_DIR_EXCL/$2
					else
						virhe "ALREADY done backup today" $2
					fi
				else virhe "NOT FOUND" exclude file; fi; else virhe "NOT FOUND" local dir $SYNK_LDIR; fi;;
			upl) if [ -d $SYNK_L_UPL_DIR ]; then if [ -f $KR_DIR_EXCL/$2 ]; then
					rsync $SYNK_PARAM $SYNK_L_UPL_DIR $SYNK_USERNAME'@'$SYNK_HOSTNAME':'$SYNK_R_UPL_DIR --exclude-from $KR_DIR_EXCL/$2
				else virhe "NOT FOUND" exclude file; fi; else virhe "NOT FOUND" local dir $SYNK_L_UPL_DIR; fi;;
			*) synk_real syn $2;; #virhe SYNK real "-" "no protocol!";;
		esac
	else
		if [ -f $KR_DIR_SITES/$2.sh ]; then
			. $KR_DIR_SITES/$2.sh $1
		else
			virhe SYNK $1 $2 "connection not recognized!"
		fi
	fi
}

synkronoi() {
	case $1 in
		syn) synk_real syn $2;;
		SYN) synk_real SYN $2;;
		ssh) synk_real ssh $2;;
		upl) synk_real upl $2;;
		*) synk_real syn $1;;
	esac
}
