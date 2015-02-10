#!/bin/bash
#vs.sh, from kir_svn.sh, L 3.2.2014
if [ "$VERBOSITY" -ge "$LEV_V" ]; then tynnyri VS; fi

vs_projekti() {
	echo "[[ VS $1 $2 $3 ]]"
	if [ "$1" != "" ] && [ -d ~/$KR_DIR_PROJ/$1 ]; then 
		cd ~/$KR_DIR_PROJ/$1
		case $2 in
			co) echo vs co svn+ssh://$KR_DIR_REPOS/$1 $1;;
			go) cd $3; vs status;;
			info) vs info;;
			rev) vs info|grep Revision;;
			revision) vs info|grep Revision;;
			st) vs status;;
			status) vs status;;
			tila) vs status;;
			up) if [ $VERKKO != "NADA" ]; then vs update; fi;;
			upd) if [ $VERKKO != "NADA" ]; then vs update; fi;;
			update) if [ $VERKKO != "NADA" ]; then vs update; fi;;
			*) vs status;;
		esac
	fi

}
