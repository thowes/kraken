#!/bin/bash
tccm() {
	KR_TC_NAME=$(echo $3|awk -F "." '{print $1}'); KAYTTIS=$(kayttis); case $KAYTTIS in
		cygwin) KRN_TC_DIR="/cygdrive";;
		darwin) KRN_TC_DIR="/Volumes";;
		ubuntu) KRN_TC_DIR="/media/$USER";;
		wsl) KRN_TC_DIR="/mnt";;
	esac; echo "TTCM 1:$1 2:$2 3:$3 4:$4 5:$5"; #if [ -d $KRN_TC_DIR/$2/ ]; then
	case $1 in
		all) case $KAYTTIS in
				cygwin|wsl) $APP $TC_ARGS /d;;
				*) tc -d;;
			esac;;
		dm) case $KAYTTIS in
				cygwin|wsl) vc /q /s /d $2;;
				darwin) tc -d $KRN_TC_DIR/$2;;
				*) tc -d $2;;
			esac;;
		ro) case $KAYTTIS in
				cygwin|wsl)
					if [ "_$4_" != "__" ]; then
						$APP $TC_ARGS /m ro /m rm /l $2 /v $3 /p $PASSU /k "$4"
					else
						$APP $TC_ARGS /m ro /m rm /l $2 /v $3 /p $PASSU /k \"\"
					fi;;
				darwin) if [ "_$4_" != "__" ]; then $APP -m ro $3 -p $PASSU -k "$4" $KRN_TC_DIR/$2; else $APP -m ro $3 -p $PASSU -k "" $KRN_TC_DIR/$2; fi;;
			esac;;
		ts) case $KAYTTIS in
				cygwin|wsl)
					if [ "_$4_" != "__" ]; then
						$APP $TC_ARGS /m ts /m rm /l $2 /v $3 /p $PASSU /k "$4"
					else
						$APP $TC_ARGS /m ts /m rm /l $2 /v $3 /p $PASSU /k \"\"
					fi;;
			darwin) if [ "_$4_" != "__" ]; then $APP -m ts $3 -p $PASSU -k "$4" $KRN_TC_DIR/$2; else $APP -m ts $3 -p $PASSU -k "" $KRN_TC_DIR/$2; fi  ;;
			esac;;
		*) virhe "TCCM command" $1 "not recognized.";;
	esac
	#if [ -f $KRN_TC_DIR/$2/$KR_TC_NAME.sh ]; then . $KRN_TC_DIR/$2/$KR_TC_NAME.sh; else echo NO: $KRN_TC_DIR/$2/$KR_TC_NAME.sh; fi
	#fi
}
