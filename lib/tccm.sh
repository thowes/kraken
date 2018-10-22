#!/bin/bash

tccm() {
	debug TTCM $1 $2 $3
	KR_TC_NAME=$(echo $3|awk -F "." '{print $1}')
	case $KAYTTIS in
		cygwin) KRN_TC_DIR="/cygdrive";;
		darwin) KRN_TC_DIR="/Volumes";;
		ubuntu) KRN_TC_DIR="/media/$USER";;
	esac
	if [ -d $KRN_TC_DIR/$2/ ]; then
		case $1 in
			all) case $KAYTTIS in
					cygwin) tc /q /s /d;;
					*) tc -d;;
				esac;;
			dm) case $KAYTTIS in
					cygwin) tc /q /s /d $2;;
					darwin) tc -d $KRN_TC_DIR/$2;;
					*) tc -d $2;;
				esac;;
			*) virhe "Drive directory already in use.";;
		esac
	else
		case $1 in
			ro) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /m ro /v $3 /p $KRN_PASSU /k $4;;
				*) tc -m ro $3 -p $KRN_PASSU -k $4 $KRN_TC_DIR/$2;;
			esac;;
			rw) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /m ts /v $3 /p $KRN_PASSU /k $4;;
				*) tc -m ts $3 -p $KRN_PASSU -k $4 $KRN_TC_DIR/$2;;
			esac;;
			vo) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /m ro /v $3 /p $KRN_PASSU;;
				*) tc -m ro $3 -p $KRN_PASSU $KRN_TC_DIR/$2;;
			esac;;
			vw) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /m ts /v $3 /p $KRN_PASSU;;
				*) tc -m ts $3 -p $KRN_PASSU $KRN_TC_DIR/$2;;
			esac;;
			*) virhe "TCCM command" $1 "not recognized.";;
		esac
		if [ -f $KRN_TC_DIR/$2/$KR_TC_NAME.sh ]; then . $KRN_TC_DIR/$2/$KR_TC_NAME.sh; else echo NO: $KRN_TC_DIR/$2/$KR_TC_NAME.sh; fi
	fi
}
