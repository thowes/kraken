#!/bin/bash
#kaiku.sh, L 14.1.2014
if [ $VERBOSITY -ge $LEV_V ]; then echo "[[ KRAKEN/KAIKU ]]"; fi
TYNNYRI=""

debug() {
	if [ $VERBOSITY -ge $LEV_D ]; then 
		echo -e "[[\e[e33 DEBUG $1 $2 $3 $4\e[0m ]]"
	fi 
}

kaiku() {
	echo "[[ $1 $2 $3 $4 ]]"
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
	if [ $VERBOSITY -ge $LEV_V ]; then echo "[[ $1 $2 $3 $4 ]]"; fi
}

virhe() {
	echo -e "[[\e[91m ERR $1 $2 $3 $4\e[0m ]]" 
}

