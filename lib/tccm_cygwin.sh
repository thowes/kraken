#!/bin/bash
#tccm.sh, L 2.4.2013
if [ $KR_DEBUG == "true" ]; then tynnyri TCCM; fi
KR_PASSU=passu1
KR_SALIS=passu2

tccm() {
	debug TTCM $1 $2 $3
	KR_TC_NAME=$(echo $3|awk -F "." '{print $1}')
	case $1 in
		dm) case $KAYTTIS in
				cygwin) tc /q /s /d $2;;
				darwin) tc -d l$2;;
			esac;;
		key) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /m ts /v $3 /p $KR_PASSU /k $4;;
				darwin) tc -m ts $3 -p $KR_PASSU -k $4 /Volumes/l$2;;
			esac;;
		mt) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /m ts /v $3 /p $KR_SALIS /k $4;;
				darwin) tc -m ts $3 -p $KR_SALIS -k $4 /Volumes/l$2;;
			esac;;
		nk) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /v $3 /p $KR_SALIS;;
				darwin) tc -m ts $3 -p $KR_SALIS /Volumes/l$2;;
			esac;;
		pwd) tcc_passu;;
		ro) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /m ro /v $3 /p $KR_PASSU /k $4;;
				darwin) tc -m ro $3 -p $KR_PASSU -k $4 /Volumes/l$2;;
			esac;;
		rw) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /m ts /v $3 /p $KR_PASSU /k $4;;
				darwin) tc -m ts $3 -p $KR_PASSU -k $4 /Volumes/l$2;;
			esac;;
		v1) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /v $3 /p $KR_PASSU;;
				darwin) tc -m ts $3 -p $KR_PASSU /Volumes/l$2;;
			esac;;
		v2) case $KAYTTIS in
				cygwin) tc /l$2 /q /s /v $3 /p $KR_SALIS;;
				darwin) tc -m ts $3 -p $KR_SALIS /Volumes/l$2;;
			esac;;
		wipe) KR_PASSU=passu1; KR_SALIS=passu2;;
		*)  case $KAYTTIS in
				cygwin) tc /q /s /d;;
				darwin) tc -d;;
			esac;;
	esac
	if [ -f /cygdrive/$2/$KR_TC_NAME.sh ]; then . /cygdrive/$2/$KR_TC_NAME.sh; else echo NO: /cygdrive/$2/$KR_TC_NAME.sh; fi
}
