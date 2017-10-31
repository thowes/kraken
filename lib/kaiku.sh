#!/bin/bash
#kaiku.sh, L 14.1.2014
if [ $KR_DEBUG == "true" ]; then echo "[[ KRAKEN/KAIKU ]]"; fi
TYNNYRI=""

debug() {
	if [ $KR_DEBUG == "true" ]; then 
		echo -e "[[ DEBUG $1 $2 $3 $4 ]]"
	fi 
}

kaiku() {
	echo "[[ $1 $2 $3 $4 ]]"
}

kaiku80() {
	echo 12345678901234567890123456789012345678901234567890123456789012345678901234567890
}


tynnyri() {
	case $1 in
		a) tynnyri add $2;;
		add) TYNNYRI="$TYNNYRI $2,";;
		d) tynnyri dump $2;;
		del) TYNNYRI="";;
		k) tynnyri kick;;
		dump) TYNNYRI="$TYNNYRI$2"; tynnyri kick;;
		kick) echo "[[ $TYNNYRI ]]"; tynnyri del;;
		new) TYNNYRI="$2";;
		pr) echo "[[ $TYNNYRI ]]";;
		*) tynnyri add $1;;
	esac
}

verboosi() {
	if [ $KR_DEBUG == "true" ]; then echo "[[ $1 $2 $3 $4 ]]"; fi
}

virhe() {
	echo -e "[[ ERR $1 $2 $3 $4 ]]" 
}

