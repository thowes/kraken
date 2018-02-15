#!/bin/bash
if [ $KR_DEBUG == "true" ]; then tynnyri TCCM; fi
KR_PASSU=passu1; KR_SALIS=passu2

tccm() {
	debug TTCM $1 $2 $3
	KR_TC_NAME=$(echo $3|awk -F "." '{print $1}')
	case $KAYTTIS in
		darwin) KRN_TC_DIR="/Volumes";;
		ubuntu) KRN_TC_DIR="/media/$USER";;
	esac
	case $1 in
		dm) case $KAYTTIS in
				cygwin) tc /q /s /d $2;;
				*) tc -d l$2;;
			esac;;
		key) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /m ts /v $3 /p $KR_PASSU /k $4; if [ -f /cygdrive/$2/$KR_TC_NAME.sh ]; then . /cygdrive/$2/$KR_TC_NAME.sh; else echo NO: /cygdrive/$2/$KR_TC_NAME.sh; fi;;
				darwin) tc -m ts $3 -p $KR_PASSU -k $4 /Volumes/l$2; if [ -f /Volumes/l$2/$KR_TC_NAME.sh ]; then . /Volumes/l$2/$KR_TC_NAME.sh; else echo NO: /Volumes/l$2/$KR_TC_NAME.sh; fi;;
				ubuntu) tc -m ts $3 -p $KR_PASSU -k $4 /media/$USER/l$2; if [ -f /media/$USER/l$2/$KR_TC_NAME.sh ]; then . /media/$USER/l$2/$KR_TC_NAME.sh; else echo NO: /media/$USER/l$2/$KR_TC_NAME.sh; fi;;
			esac;;
		mt) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /m ts /v $3 /p $KR_SALIS /k $4; if [ -f /cygdrive/$2/$KR_TC_NAME.sh ]; then . /cygdrive/$2/$KR_TC_NAME.sh; else echo NO: /cygdrive/$2/$KR_TC_NAME.sh; fi;;
				darwin) tc -m ts $3 -p $KR_SALIS -k $4 /Volumes/l$2; if [ -f /Volumes/l$2/$KR_TC_NAME.sh ]; then . /Volumes/l$2/$KR_TC_NAME.sh; else echo NO: /Volumes/l$2/$KR_TC_NAME.sh; fi;;
				ubuntu) tc -m ts $3 -p $KR_SALIS -k $4 /media/$USER/Volumes/l$2; if [ -f /media/$USER/l$2/$KR_TC_NAME.sh ]; then . /media/$USER/l$2/$KR_TC_NAME.sh; else echo NO: /media/$USER/l$2/$KR_TC_NAME.sh; fi;;
			esac;;	
		nk) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /v $3 /p $KR_SALIS; if [ -f /cygdrive/$2/$KR_TC_NAME.sh ]; then . /cygdrive/$2/$KR_TC_NAME.sh; else echo NO: /cygdrive/$2/$KR_TC_NAME.sh; fi;;
				darwin) tc -m ts $3 -p $KR_SALIS /Volumes/l$2; if [ -f /Volumes/l$2/$KR_TC_NAME.sh ]; then . /Volumes/l$2/$KR_TC_NAME.sh; else echo NO: /Volumes/l$2/$KR_TC_NAME.sh; fi;;
				ubuntu) tc -m ts $3 -p $KR_SALIS /media/$USER/l$2; if [ -f /media/$USER/l$2/$KR_TC_NAME.sh ]; then . /media/$USER/l$2/$KR_TC_NAME.sh; else echo NO: /media/$USER/l$2/$KR_TC_NAME.sh; fi;;
			esac;;
		ro) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /m ro /v $3 /p $KR_PASSU /k $4; if [ -f /cygdrive/$2/$KR_TC_NAME.sh ]; then . /cygdrive/$2/$KR_TC_NAME.sh; else echo NO: /cygdrive/$2/$KR_TC_NAME.sh; fi;;
				darwin) tc -m ro $3 -p $KR_PASSU -k $4 /Volumes/l$2; if [ -f /Volumes/l$2/$KR_TC_NAME.sh ]; then . /Volumes/l$2/$KR_TC_NAME.sh; else echo NO: /Volumes/l$2/$KR_TC_NAME.sh; fi;;
				ubuntu) tc -m ro $3 -p $KR_PASSU -k $4 /media/$USER/l$2; if [ -f /media/$USER/l$2/$KR_TC_NAME.sh ]; then . /media/$USER/l$2/$KR_TC_NAME.sh; else echo NO: /media/$USER/l$2/$KR_TC_NAME.sh; fi;;
			esac;;
		rw) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /m ts /v $3 /p $KR_PASSU /k $4; if [ -f /cygdrive/$2/$KR_TC_NAME.sh ]; then . /cygdrive/$2/$KR_TC_NAME.sh; else echo NO: /cygdrive/$2/$KR_TC_NAME.sh; fi;;
				darwin) tc -m ts $3 -p $KR_PASSU -k $4 /Volumes/l$2; if [ -f /Volumes/l$2/$KR_TC_NAME.sh ]; then . /Volumes/l$2/$KR_TC_NAME.sh; else echo NO: /Volumes/l$2/$KR_TC_NAME.sh; fi;;
				ubuntu) tc -m ts $3 -p $KR_PASSU -k $4 /media/$USER/l$2; if [ -f /media/$USER/l$2/$KR_TC_NAME.sh ]; then . /media/$USER/l$2/$KR_TC_NAME.sh; else echo NO: /media/$USER/l$2/$KR_TC_NAME.sh; fi;;
			esac;;
		rx) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /m ro /v $3 /p $KR_SALIS; if [ -f /cygdrive/$2/$KR_TC_NAME.sh ]; then . /cygdrive/$2/$KR_TC_NAME.sh; else echo NO: /cygdrive/$2/$KR_TC_NAME.sh; fi;;
				darwin) tc -m ro $3 -p $KR_SALIS /Volumes/l$2; if [ -f /Volumes/l$2/$KR_TC_NAME.sh ]; then . /Volumes/l$2/$KR_TC_NAME.sh; else echo NO: /Volumes/l$2/$KR_TC_NAME.sh; fi;;
				ubuntu) tc -m ro $3 -p $KR_SALIS /media/$USER/l$2; if [ -f /media/$USER/l$2/$KR_TC_NAME.sh ]; then . /media/$USER/l$2/$KR_TC_NAME.sh; else echo NO: /media/$USER/l$2/$KR_TC_NAME.sh; fi;;
			esac;;
		v1) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /v $3 /p $KR_PASSU; if [ -f /cygdrive/$2/$KR_TC_NAME.sh ]; then . /cygdrive/$2/$KR_TC_NAME.sh; else echo NO: /cygdrive/$2/$KR_TC_NAME.sh; fi;;
				darwin) tc -m ts $3 -p $KR_PASSU /Volumes/l$2; if [ -f /Volumes/l$2/$KR_TC_NAME.sh ]; then . /Volumes/l$2/$KR_TC_NAME.sh; else echo NO: /Volumes/l$2/$KR_TC_NAME.sh; fi;;
				ubuntu) tc -m ts $3 -p $KR_PASSU /media/$USER/l$2; if [ -f /media/$USER/l$2/$KR_TC_NAME.sh ]; then . /media/$USER/l$2/$KR_TC_NAME.sh; else echo NO: /media/$USER/l$2/$KR_TC_NAME.sh; fi;;
			esac;;
		vro) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /m ro /v $3 /p $KR_PASSU; if [ -f /cygdrive/$2/$KR_TC_NAME.sh ]; then . /cygdrive/$2/$KR_TC_NAME.sh; else echo NO: /cygdrive/$2/$KR_TC_NAME.sh; fi;;
				darwin) tc -m ro $3 -p $KR_PASSU /Volumes/l$2; if [ -f /Volumes/l$2/$KR_TC_NAME.sh ]; then . /Volumes/l$2/$KR_TC_NAME.sh; else echo NO: /Volumes/l$2/$KR_TC_NAME.sh; fi;;
				ubuntu) tc -m ro $3 -p $KR_PASSU /media/$USER/l$2; if [ -f /media/$USER/l$2/$KR_TC_NAME.sh ]; then . /media/$USER/l$2/$KR_TC_NAME.sh; else echo NO: /media/$USER/l$2/$KR_TC_NAME.sh; fi;;
			esac;;
		v2) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /v $3 /p $KR_SALIS; if [ -f /cygdrive/$2/$KR_TC_NAME.sh ]; then . /cygdrive/$2/$KR_TC_NAME.sh; else echo NO: /cygdrive/$2/$KR_TC_NAME.sh; fi;;
				darwin) tc -m ts $3 -p $KR_SALIS /Volumes/l$2; if [ -f /Volumes/l$2/$KR_TC_NAME.sh ]; then . /Volumes/l$2/$KR_TC_NAME.sh; else echo NO: /Volumes/l$2/$KR_TC_NAME.sh; fi;;
				ubuntu) tc -m ts $3 -p $KR_SALIS /media/$USER/l$2; if [ -f /media/$USER/l$2/$KR_TC_NAME.sh ]; then . /media/$USER/l$2/$KR_TC_NAME.sh; else echo NO: /media/$USER/l$2/$KR_TC_NAME.sh; fi;;
			esac;;
		wipe) KR_PASSU=passu1; KR_SALIS=passu2;;
		*)  case $KAYTTIS in
				cygwin) tc /q /s /d;;
				*) tc -d;;
			esac;;
	esac
}
