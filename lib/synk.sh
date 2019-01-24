#!/bin/bash
synkronoi() {
	KR_DIR_CFG=$(asetus dir:cfg)
	KR_DIR_EXCL=$(asetus dir:excl)
	case $1 in
		csv) synkronoi ssh $2;;
		dwl) if [ -f $KR_DIR_CFG/dwl.csv ]; then
				KR_SYNK_N=_$(cat $KR_DIR_CFG/dwl.csv | \grep $2 | wc -l | tr -s ' ' | tr " " "_" )_
				case $KR_SYNK_N in
					*_0_) virhe "information not found.";;
					*_1_) KR_SYNK_LINE=$(cat $KR_DIR_CFG/dwl.csv | \grep $2)
						KR_SYNK_EXCL=$KR_DIR_EXCL/$(echo $KR_SYNK_LINE|awk -F\; '{print $1}').lst
						if [ -f $KR_SYNK_EXCL ]; then debug "file exists."; else KR_SYNK_EXCL=$KR_DIR_EXCL/default.lst; fi
						KR_SYNK_SERVER=$(echo $KR_SYNK_LINE|awk -F\; '{print $2}')
						KR_SYNK_USER=$(echo $KR_SYNK_LINE|awk -F\; '{print $3}')
						KR_SYNK_PARAM=$(echo $KR_SYNK_LINE|awk -F\; '{print $4}')
						KR_SYNK_LDIR=$(echo $KR_SYNK_LINE|awk -F\; '{print $5}')
						KR_SYNK_RDIR=$(echo $KR_SYNK_LINE|awk -F\; '{print $6}')
						if [ -d $KR_SYNK_LDIR ]; then
							# Getting the last row of backup.log and splitting it to retrieve the part of the string for latest backup date.
							BU_LATEST_DATE=$(latest $KR_SYNK_LDIR|awk '{print $1}'); BU_TODAY_DATE=$(date +"%F")
							# Compare the date in latest line of backup.log, if not today, then continue. Doesn't do backup runs if already backed up today (checkup happens in bulog)
							if [ "$BU_LATEST_DATE" != "$BU_TODAY_DATE" ]; then
								kaiku SY $1 $2 $KR_SYNK_USER@$KR_SYNK_SERVER
								compu_secu
								bulog-add $KR_SYNK_LDIR $2 $KR_SYNK_USER@$KR_SYNK_SERVER:$KR_SYNK_RDIR
								rsync $KR_SYNK_PARAM $KR_SYNK_USER@$KR_SYNK_SERVER:$KR_SYNK_RDIR $KR_SYNK_LDIR --exclude-from $KR_SYNK_EXCL
							else virhe "ALREADY done backup today" $2; fi
						else virhe DIR $KR_SYNK_LDIR not found.; fi;;
					*) virhe "found too many sites ($KR_SYNK_N) .";;
				esac; else virhe "csv file not found."; fi;;
		ssh) if [ -f $KR_DIR_CFG/dwl.csv ] && [ -f $KR_DIR_CFG/upl.csv ]; then
				KR_SYNK_N=_$(cat $KR_DIR_CFG/*l.csv | \grep $2 | wc -l | tr -s ' ' | tr " " "_" )_
				case $KR_SYNK_N in
					*_0_) virhe "information not found.";;
					*_1_) KR_SYNK_LINE=$(cat $KR_DIR_CFG/*l.csv | \grep $2)
						KR_SYNK_SERVER=$(echo $KR_SYNK_LINE|awk -F\; '{print $2}')
						KR_SYNK_USER=$(echo $KR_SYNK_LINE|awk -F\; '{print $3}')
						kaiku SY $1 $2 $KR_SYNK_USER@$KR_SYNK_SERVER
						compu_secu
						ssh $KR_SYNK_USER@$KR_SYNK_SERVER
						;;
					*) virhe "found too many sites (" "$KR_SYNK_N" ")." ;;
				esac; else virhe "csv file(s) not found."; fi;;
		syn) synkronoi upl $2;;
		upl) if [ -f $KR_DIR_CFG/upl.csv ]; then
				KR_SYNK_N=_$(cat $KR_DIR_CFG/upl.csv | \grep $2 | wc -l | tr -s ' ' | tr " " "_" )_
				case $KR_SYNK_N in
					*_0_) virhe "information not found.";;
					*_1_) KR_SYNK_LINE=$(cat $KR_DIR_CFG/upl.csv | \grep $2)
						KR_SYNK_EXCL=$KR_DIR_EXCL/$(echo $KR_SYNK_LINE|awk -F\; '{print $1}').lst
						if [ -f $KR_SYNK_EXCL ]; then debug "file exists."; else KR_SYNK_EXCL=$KR_DIR_EXCL/default.lst; fi
						KR_SYNK_SERVER=$(echo $KR_SYNK_LINE|awk -F\; '{print $2}')
						KR_SYNK_USER=$(echo $KR_SYNK_LINE|awk -F\; '{print $3}')
						KR_SYNK_PARAM=$(echo $KR_SYNK_LINE|awk -F\; '{print $4}')
						KR_SYNK_LDIR=$(echo $KR_SYNK_LINE|awk -F\; '{print $5}')
						KR_SYNK_RDIR=$(echo $KR_SYNK_LINE|awk -F\; '{print $6}')
						if [ -d $KR_SYNK_LDIR ]; then
							# Getting the last row of backup.log and splitting it to retrieve the part of the string for latest backup date.
							BU_LATEST_DATE=$(latest $KR_SYNK_LDIR|awk '{print $1}'); BU_TODAY_DATE=$(date +"%F")
							# Compare the date in latest line of backup.log, if not today, then continue. Doesn't do backup runs if already backed up today (checkup happens in bulog)
							if [ "$BU_LATEST_DATE" != "$BU_TODAY_DATE" ]; then
								kaiku SY $1 $2 $KR_SYNK_USER@$KR_SYNK_SERVER
								compu_secu
								bulog-add $KR_SYNK_LDIR $2 $HOSTNAME $KR_SYNK_USER@$KR_SYNK_SERVER:$KR_SYNK_RDIR
								rsync $KR_SYNK_PARAM $KR_SYNK_LDIR $KR_SYNK_USER@$KR_SYNK_SERVER:$KR_SYNK_RDIR --exclude-from $KR_SYNK_EXCL
							else virhe "ALREADY done backup today" $2; fi
						else virhe DIR $KR_SYNK_LDIR not found.; fi;;
					*) virhe "found too many sites.";;
				esac; else virhe "csv file not found" "($KR_SYNK_N)" "."; fi;;
		ups) synkronoi upl $2;;
		*) synkronoi upl $1;;
	esac
}
