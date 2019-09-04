#!/bin/bash
tccm() {
	KR_TC_NAME=$(echo $3|awk -F "." '{print $1}'); KAYTTIS=$(kayttis); case $KAYTTIS in
		cygwin) KRN_TC_DIR="/cygdrive";;
		darwin) KRN_TC_DIR="/Volumes";;
		ubuntu) KRN_TC_DIR="/media/$USER";;
		wsl) KRN_TC_DIR="/mnt";;
	esac; echo "TTCM 1:$1 2:$2 3:$3 4:$4 5:$5"
	case $KAYTTIS in
		darwin) case $1 in
				all) tc -d;;
				dm) tc -d $KRN_TC_DIR/$2;;
				ro) if [ "_$4_" != "__" ]; then $APP -m ro $3 -p $PASSU -k "$4" $KRN_TC_DIR/$2; else $APP -m ro $3 -p $PASSU -k "" $KRN_TC_DIR/$2; fi;;
				ts) if [ "_$4_" != "__" ]; then $APP -m ts $3 -p $PASSU -k "$4" $KRN_TC_DIR/$2; else $APP -m ts $3 -p $PASSU -k "" $KRN_TC_DIR/$2; fi;;
				*) virhe "TCCM command" $1 "not recognized.";;
			esac;;
		cygwin|wsl) case $1 in
				all) $APP $TC_ARGS /d;;
				dm) vc /q /s /d $2;;
				ro) case $KAYTTIS in
					if [ "_$4_" != "__" ]; then
						$APP $TC_ARGS /m ro /m rm /l $2 /v $3 /p $PASSU /k "$4"
					else
						$APP $TC_ARGS /m ro /m rm /l $2 /v $3 /p $PASSU /k \"\"
					fi;;
		ts) case $KAYTTIS in
				cygwin|wsl)
					if [ "_$4_" != "__" ]; then
						$APP $TC_ARGS /m ts /m rm /l $2 /v $3 /p $PASSU /k "$4"
					else
						$APP $TC_ARGS /m ts /m rm /l $2 /v $3 /p $PASSU /k \"\"
					fi;;
			esac;;
		*) virhe "TCCM command" $1 "not recognized.";;
	esac;; esac
	#if [ -f $KRN_TC_DIR/$2/$KR_TC_NAME.sh ]; then . $KRN_TC_DIR/$2/$KR_TC_NAME.sh; else echo NO: $KRN_TC_DIR/$2/$KR_TC_NAME.sh; fi
}
