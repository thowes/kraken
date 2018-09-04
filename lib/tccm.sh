#!/bin/bash
KR_PASSU=passu1; KR_SALIS=passu2

tccm() {
	debug TTCM $1 $2 $3
	KR_TC_NAME=$(echo $3|awk -F "." '{print $1}')
	case $KAYTTIS in
		cygwin) KRN_TC_DIR="/cygdrive";;
		darwin) KRN_TC_DIR="/Volumes";;
		ubuntu) KRN_TC_DIR="/media/$USER";;
	esac
	case $1 in
		dm) case $KAYTTIS in
				cygwin) tc /q /s /d $2;;
				*) tc -d l$2;;
			esac;;
		key) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /m ts /v $3 /p $KR_PASSU /k $4; if [ -f $KRN_TC_DIR/$2/$KR_TC_NAME.sh ]; then . $KRN_TC_DIR/$2/$KR_TC_NAME.sh; else echo NO: $KRN_TC_DIR/$2/$KR_TC_NAME.sh; fi;;
				*) tc -m ts $3 -p $KR_PASSU -k $4 $KRN_TC_DIR/l$2; if [ -f $KRN_TC_DIR/l$2/$KR_TC_NAME.sh ]; then . $KRN_TC_DIR/l$2/$KR_TC_NAME.sh; else echo NO: $KRN_TC_DIR/l$2/$KR_TC_NAME.sh; fi;;
			esac;;
		mt) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /m ts /v $3 /p $KR_SALIS /k $4; if [ -f $KRN_TC_DIR/$2/$KR_TC_NAME.sh ]; then . $KRN_TC_DIR/$2/$KR_TC_NAME.sh; else echo NO: $KRN_TC_DIR/$2/$KR_TC_NAME.sh; fi;;
				*) tc -m ts $3 -p $KR_SALIS -k $4 $KRN_TC_DIR/l$2; if [ -f $KRN_TC_DIR/l$2/$KR_TC_NAME.sh ]; then . $KRN_TC_DIR/l$2/$KR_TC_NAME.sh; else echo NO: $KRN_TC_DIR/l$2/$KR_TC_NAME.sh; fi;;
			esac;;
		nk) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /v $3 /p $KR_SALIS; if [ -f $KRN_TC_DIR/$2/$KR_TC_NAME.sh ]; then . $KRN_TC_DIR/$2/$KR_TC_NAME.sh; else echo NO: $KRN_TC_DIR/$2/$KR_TC_NAME.sh; fi;;
				*) tc -m ts $3 -p $KR_SALIS $KRN_TC_DIR/l$2; if [ -f $KRN_TC_DIR/l$2/$KR_TC_NAME.sh ]; then . $KRN_TC_DIR/l$2/$KR_TC_NAME.sh; else echo NO: $KRN_TC_DIR/l$2/$KR_TC_NAME.sh; fi;;
			esac;;
		ro) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /m ro /v $3 /p $KRN_PASSU /k $4; if [ -f $KRN_TC_DIR/$2/$KR_TC_NAME.sh ]; then . $KRN_TC_DIR/$2/$KR_TC_NAME.sh; else echo NO: $KRN_TC_DIR/$2/$KR_TC_NAME.sh; fi;;
				*) tc -m ro $3 -p $KRN_PASSU -k $4 $KRN_TC_DIR/l$2; if [ -f $KRN_TC_DIR/l$2/$KR_TC_NAME.sh ]; then . $KRN_TC_DIR/l$2/$KR_TC_NAME.sh; else echo NO: $KRN_TC_DIR/l$2/$KR_TC_NAME.sh; fi;;
			esac;;
		rw) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /m ts /v $3 /p $KRN_PASSU /k $4; if [ -f $KRN_TC_DIR/$2/$KR_TC_NAME.sh ]; then . $KRN_TC_DIR/$2/$KR_TC_NAME.sh; else echo NO: $KRN_TC_DIR/$2/$KR_TC_NAME.sh; fi;;
				*) tc -m ts $3 -p $KRN_PASSU -k $4 $KRN_TC_DIR/l$2; if [ -f $KRN_TC_DIR/l$2/$KR_TC_NAME.sh ]; then . $KRN_TC_DIR/l$2/$KR_TC_NAME.sh; else echo NO: $KRN_TC_DIR/l$2/$KR_TC_NAME.sh; fi;;
			esac;;
		rx) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /m ro /v $3 /p $KR_SALIS; if [ -f $KRN_TC_DIR/$2/$KR_TC_NAME.sh ]; then . $KRN_TC_DIR/$2/$KR_TC_NAME.sh; else echo NO: $KRN_TC_DIR/$2/$KR_TC_NAME.sh; fi;;
				*) tc -m ro $3 -p $KR_SALIS $KRN_TC_DIR/l$2; if [ -f $KRN_TC_DIR/l$2/$KR_TC_NAME.sh ]; then . $KRN_TC_DIR/l$2/$KR_TC_NAME.sh; else echo NO: $KRN_TC_DIR/l$2/$KR_TC_NAME.sh; fi;;
			esac;;
		v1) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /v $3 /p $KR_PASSU; if [ -f $KRN_TC_DIR/$2/$KR_TC_NAME.sh ]; then . $KRN_TC_DIR/$2/$KR_TC_NAME.sh; else echo NO: $KRN_TC_DIR/$2/$KR_TC_NAME.sh; fi;;
				*) tc $3 -p $KR_PASSU $KRN_TC_DIR/l$2; if [ -f $KRN_TC_DIR/l$2/$KR_TC_NAME.sh ]; then . $KRN_TC_DIR/l$2/$KR_TC_NAME.sh; else echo NO: $KRN_TC_DIR/l$2/$KR_TC_NAME.sh; fi;;
			esac;;
		vo) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /m ro /v $3 /p $KRN_PASSU; if [ -f $KRN_TC_DIR/$2/$KR_TC_NAME.sh ]; then . $KRN_TC_DIR/$2/$KR_TC_NAME.sh; else echo NO: $KRN_TC_DIR/$2/$KR_TC_NAME.sh; fi;;
				*) tc -m ro $3 -p $KRN_PASSU $KRN_TC_DIR/l$2; if [ -f $KRN_TC_DIR/l$2/$KR_TC_NAME.sh ]; then . $KRN_TC_DIR/l$2/$KR_TC_NAME.sh; else echo NO: $KRN_TC_DIR/l$2/$KR_TC_NAME.sh; fi;;
			esac;;
		vw) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /m ts /v $3 /p $KRN_PASSU; if [ -f $KRN_TC_DIR/$2/$KR_TC_NAME.sh ]; then . $KRN_TC_DIR/$2/$KR_TC_NAME.sh; else echo NO: $KRN_TC_DIR/$2/$KR_TC_NAME.sh; fi;;
				*) tc -m ts $3 -p $KRN_PASSU $KRN_TC_DIR/l$2; if [ -f $KRN_TC_DIR/l$2/$KR_TC_NAME.sh ]; then . $KRN_TC_DIR/l$2/$KR_TC_NAME.sh; else echo NO: $KRN_TC_DIR/l$2/$KR_TC_NAME.sh; fi;;
			esac;;
		wipe) KR_PASSU=passu1; KR_SALIS=passu2;;
		*)  case $KAYTTIS in
				cygwin) tc /q /s /d;;
				*) tc -d;;
			esac;;
	esac
}
