#!/bin/bash
tccm() {
	echo "TTCM 1:$1 2:$2 3:$3 4:$4 5:$5"; pwd; KR_TC_NAME=$(echo $3|awk -F "." '{print $1}'); KAYTTIS=$(kayttis); case $KAYTTIS in
		cygwin) KRN_TC_DIR="/cygdrive";;
		darwin) KRN_TC_DIR="/Volumes";;
		ubuntu) KRN_TC_DIR="/media/$USER";;
		wsl) KRN_TC_DIR="/mnt";;
	esac
	if [ -d $KRN_TC_DIR/$2/ ]; then
		case $1 in
			all) case $KAYTTIS in
					cygwin|wsl) vc /q /s /d;;
					*) tc -d;;
				esac;;
			dm) case $KAYTTIS in
					cygwin|wsl) tc /q /s /d $2;;
					darwin) tc -d $KRN_TC_DIR/$2;;
					*) tc -d $2;;
				esac;;
			*) virhe "Drive directory already in use.";;
		esac
	else
		case $1 in
			ko) case $KAYTTIS in
				cygwin|wsl) tc /l$2 /q /s /m ro /m rm /v $3 /p $KRN_PASSU;;
				*) tc -m ro $3 -p $KRN_PASSU $KRN_TC_DIR/$2;;
			esac;;
			kw) case $KAYTTIS in
				cygwin|wsl) tc /l$2 /q /s /m ts /m rm /v $3 /p $KRN_PASSU;;
				*) tc -m ts $3 -p $KRN_PASSU $KRN_TC_DIR/$2;;
			esac;;
			ro) case $KAYTTIS in
				cygwin|wsl) if [ "_$4_" != "__" ]; then echo $APP /m ro /m rm /v $3 /p $PASSU /k "$4" /l$2; else echo $APP /m ro /m rm /v $3 /p $PASSU /k \"\" /l$2; fi;;
				*) if [ "_$4_" != "__" ]; then $APP -m ro $3 -p $PASSU -k "$4" $KRN_TC_DIR/$2; else $APP -m ro $3 -p $PASSU -k "" $KRN_TC_DIR/$2; fi;;
			esac;;
			rw) case $KAYTTIS in
				cygwin|wsl) tc /l$2 /q /s /m rm /m ts /v $3 /p $KRN_PASSU /k $4;;
				*) tc -m rm -m ts $3 -p $KRN_PASSU -k $4 $KRN_TC_DIR/$2;;
			esac;;
			to) case $KAYTTIS in
				cygwin|wsl) tc /l$2 /q /s /m ro /m rm /v $3 /p $KRN_PASSU /k $4;;
				*) $APP -m ro $3 -p $PASSU -k $4 --mount $KRN_TC_DIR/$2;;
			esac;;
			ts) case $KAYTTIS in
				cygwin|wsl) if [ "_$4_" != "__" ]; then echo $APP /m ro /m rm /v $3 /p $PASSU /k "$4" /l$3; else echo $APP /m ro /m rm /v $3 /p $PASSU /k \"\" /l$3; fi;;
				*) if [ "_$4_" != "__" ]; then $APP -m ts $3 -p $PASSU -k "$4" $KRN_TC_DIR/$2; else $APP -m ts $3 -p $PASSU -k "" $KRN_TC_DIR/$2; fi  ;;
			esac;;
			tw) case $KAYTTIS in
				cygwin|wsl) tc /l$2 /q /s /m ts /m rm /v $3 /p $KRN_PASSU /k $4;;
				*) $APP -m ts $3 -p $PASSU -k $4 --mount $KRN_TC_DIR/$2;;
			esac;;
			vo) case $KAYTTIS in
				cygwin|wsl) tc /l$2 /q /s /m ro /m rm /v $3 /p $KRN_PASSU;;
				*) $APP -m ro $3 -p $PASSU -k "" --mount $KRN_TC_DIR/$2;;
			esac;;
			vw) case $KAYTTIS in
				cygwin|wsl) tc /l$2 /q /s /m ts /m rm /v $3 /p $KRN_PASSU;;
				*) $APP -m ts $3 -p $PASSU -k "" --mount $KRN_TC_DIR/$2;;
			esac;;
			*) virhe "TCCM command" $1 "not recognized.";;
		esac
		#if [ -f $KRN_TC_DIR/$2/$KR_TC_NAME.sh ]; then . $KRN_TC_DIR/$2/$KR_TC_NAME.sh; else echo NO: $KRN_TC_DIR/$2/$KR_TC_NAME.sh; fi
	fi
}
