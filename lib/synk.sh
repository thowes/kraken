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
			upl) 
					if [ -d $SYNK_L_UPL_DIR ]; then 
						if [ -f $KR_DIR_EXCL/$2 ]; then
							rsync $SYNK_PARAM $SYNK_L_UPL_DIR $SYNK_USERNAME'@'$SYNK_HOSTNAME':'$SYNK_R_UPL_DIR --exclude-from $KR_DIR_EXCL/$2
						else virhe "NOT FOUND" exclude file; 
						fi; 
					else virhe "NOT FOUND" "local dir" $SYNK_L_UPL_DIR; 
					fi;;
			*) synk_real syn $2;; #virhe SYNK real "-" "no protocol!";;
		esac
	else
		if [ -f $KR_DIR_SITES/$2.sh ]; then
			. $KR_DIR_SITES/$2.sh $1
		else 
			if [ -f $KR_DIR_SITES/$1.sh ]; then
				. $KR_DIR_SITES/$1.sh
			else
				virhe SYNK $1 $2 "connection not recognized!"
			fi
		fi
	fi
}

synkronoi() {
	case $1 in
		csv) if [ -f $KR_DIR_CFG/downloads.csv ] && [ -f $KR_DIR_CFG/uploads.csv ]; then
				case $(cat $KR_DIR_CFG/*loads.csv | \grep $2 | wc -l) in
					0) virhe "information not found.";;
					1) KR_SYNK_LINE=$(cat $KR_DIR_CFG/*loads.csv | \grep $2)
						KR_SYNK_SERVER=$(echo $KR_SYNK_LINE|awk -F\; '{print $2}')
						KR_SYNK_USER=$(echo $KR_SYNK_LINE|awk -F\; '{print $3}')
						ssh $KR_SYNK_USER@$KR_SYNK_SERVER
						;;
					*) virhe "found too many sites.";;
				esac; else virhe "csv file(s) not found."; fi;;
		dwl) if [ -f $KR_DIR_CFG/downloads.csv ]; then
				case $(cat $KR_DIR_CFG/downloads.csv | \grep $2 | wc -l) in
					0) virhe "information not found.";;
					1) KR_SYNK_LINE=$(cat $KR_DIR_CFG/downloads.csv | \grep $2)
						KR_SYNK_EXCL=$(echo $KR_SYNK_LINE|awk -F\; '{print $1}').lst
						if [ -f $KR_DIR_EXCL/$KR_SYNK_EXCL ]; then debug "file exists."; else KR_SYNK_EXCL=default.lst; fi
						KR_SYNK_SERVER=$(echo $KR_SYNK_LINE|awk -F\; '{print $2}')
						KR_SYNK_USER=$(echo $KR_SYNK_LINE|awk -F\; '{print $3}')
						KR_SYNK_PARAM=$(echo $KR_SYNK_LINE|awk -F\; '{print $4}')
						KR_SYNK_LDIR=$(echo $KR_SYNK_LINE|awk -F\; '{print $5}')
						KR_SYNK_RDIR=$(echo $KR_SYNK_LINE|awk -F\; '{print $6}')
						echo rsync $KR_SYNK_PARAM $KR_SYNK_USER@$KR_SYNK_SERVER:$KR_SYNK_RDIR $KR_SYNK_LDIR --exclude-from $KR_DIR_EXCL/$KR_SYNK_EXCL
						;;
					*) virhe "found too many sites.";;
				esac; else virhe "csv file not found."; fi;;
		syn) synk_real syn $2;;
		ssh) synk_real ssh $2;;
		upl) synk_real upl $2;;
		ups) if [ -f $KR_DIR_CFG/uploads.csv ]; then
				case $(cat $KR_DIR_CFG/uploads.csv | \grep $2 | wc -l) in
					0) virhe "information not found.";;
					1) KR_SYNK_LINE=$(cat $KR_DIR_CFG/uploads.csv | \grep $2)
						KR_SYNK_EXCL=$(echo $KR_SYNK_LINE|awk -F\; '{print $1}').lst
						if [ -f $KR_DIR_EXCL/$KR_SYNK_EXCL ]; then debug "file exists."; else KR_SYNK_EXCL=default.lst; fi
						KR_SYNK_SERVER=$(echo $KR_SYNK_LINE|awk -F\; '{print $2}')
						KR_SYNK_USER=$(echo $KR_SYNK_LINE|awk -F\; '{print $3}')
						KR_SYNK_PARAM=$(echo $KR_SYNK_LINE|awk -F\; '{print $4}')
						KR_SYNK_LDIR=$(echo $KR_SYNK_LINE|awk -F\; '{print $5}')
						KR_SYNK_RDIR=$(echo $KR_SYNK_LINE|awk -F\; '{print $6}')
						rsync $KR_SYNK_PARAM $KR_SYNK_LDIR $KR_SYNK_USER@$KR_SYNK_SERVER:$KR_SYNK_RDIR --exclude-from $KR_DIR_EXCL/$KR_SYNK_EXCL
						;;
					*) virhe "found too many sites.";;
				esac; else virhe "csv file not found."; fi;;
		*) synk_real syn $1;;
	esac
}
