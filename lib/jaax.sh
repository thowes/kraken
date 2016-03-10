#!/bin/bash
#jaax.sh, L 7.5.2005/11.6.2013/31.3.2013/24.8.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri "JAAX"; fi

jaax_dt() {
	debug "JAAX/DT" "$1 $2"
	if [ $VERBOSITY -ge $LEV_V ]; then tynnyri "$1-$2"; fi
	case $1 in
		clr)
			if [ -f ~/$KR_DIR_DT/desktop.ini ]; then
			cp ~/$KR_DIR_DT/*.url $KR_DIR_LNK/BU.$HOSTNAME/DESKTOP/; rm ~/$KR_DIR_DT/*.url
			cp ~/$KR_DIR_DT/*.lnk $KR_DIR_LNK/BU.$HOSTNAME/DESKTOP/; rm ~/$KR_DIR_DT/*.lnk
			fi;;
		c) if [ -d $KR_DIR_LNK/COMP/$2 ]; then cp $KR_DIR_LNK/COMP/$2/*.* ~/$KR_DIR_DT/; else virhe JAAX dt $1 $2; fi;;
		l) if [ -d $KR_DIR_LNK/KTXT/$2 ]; then cp $KR_DIR_LNK/KTXT/$2/*.* ~/$KR_DIR_DT/; else virhe JAAX dt $1 $2; fi;;
		p) if [ -d $KR_DIR_LNK/PROJ/$2 ]; then cp $KR_DIR_LNK/PROJ/$2/*.* ~/$KR_DIR_DT/; else virhe JAAX dt $1 $2; fi;;
		u) if [ -d $KR_DIR_LNK/USER/$2 ]; then cp $KR_DIR_LNK/USER/$2/*.* ~/$KR_DIR_DT/; else virhe JAAX dt $1 $2; fi;;
		*) if [ -d $KR_DIR_LNK/PROJ/$1 ]; then cp $KR_DIR_LNK/PROJ/$1/*.* ~/$KR_DIR_DT/; else virhe JAAX dt $1 $2; fi;;
	esac
}

jaax_sendto() {
	debug "JAAX/SENDTO" "$1 $2"
	if [ $VERBOSITY -ge $LEV_V ]; then tynnyri "S2-$1"; fi
	case $1 in
		clr) rm ~/$KR_DIR_SENDTO/*.lnk;;
		def) cp $KR_DIR_LNK/SENDTO/default/*.lnk ~/$KR_DIR_SENDTO/;;
		*) if [ -d $KR_DIR_LNK/SENDTO/$1 ]; then cp $KR_DIR_LNK/SENDTO/$1/*.lnk ~/$KR_DIR_SENDTO/; else virhe JAAX/SENDTO $1 $2; fi
	esac
}

jaax_startup() {
	debug "JAAX/STU" "$1 $2"
	if [ $VERBOSITY -ge $LEV_V ]; then tynnyri "SU-$1"; fi
	case $1 in
		clr) cp ~/$KR_DIR_STARTUP/*.lnk $KR_DIR_LNK/BU.$HOSTNAME/STARTUP/; rm ~/$KR_DIR_STARTUP/*.lnk;;
		def) cp $KR_DIR_LNK/STARTUP/default/*.lnk ~/$KR_DIR_STARTUP/;;
		*) if [ -d $KR_DIR_LNK/STARTUP/$1 ]; then cp $KR_DIR_LNK/STARTUP/$1/*.lnk ~/$KR_DIR_STARTUP/; else virhe JAAX/STARTUP $1 $2; fi;;
	esac
}

jaax() {
	debug "JAAX/MAIN"
	if [ -d $KR_DIR_LNK ]; then
		if [ $VERBOSITY -ge $LEV_V ]; then tynnyri $1-$2-$3; fi
		case $1 in
			clr) tynnyri new JAAX/CLR; jaax_ql clr;;
			dt) tynnyri new JAAX/DT; jaax_dt c $HOSTNAME; jaax_dt l $2; jaax_dt p $3; jaax_dt u $USER;;
			ql) tynnyri new JAAX/QL; jaax_dt c $HOSTNAME; jaax_dt l $2; jaax_dt p $3; jaax_dt u $USER;;
			st) tynnyri new JAAX/ST; jaax_sendto $HOSTNAME; jaax_sendto $2;;
		esac
		if [ $VERBOSITY -ge $LEV_V ]; then tynnyri kick; fi
	else
		virhe no APPLNK directory
	fi
}
