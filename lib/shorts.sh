#!/bin/bash
#shorts.sh, L 7.5.2005/11.6.2013/31.3.2013/24.8.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri "SHORTS"; fi

shorts_dt() {
	debug "SHORTS/DT" "$1 $2"
	if [ $VERBOSITY -ge $LEV_V ]; then tynnyri "$1-$2"; fi
	case $1 in
		clr)
			if [ -d $KR_DIR_LNK/BU.$HOSTNAME/DESKTOP/ ]; then
				if [ -f $KR_DIR_DT/$KR_NAME_LNK ]; then cp $KR_DIR_DT/*.lnk $KR_DIR_LNK/BU.$HOSTNAME/DESKTOP/; rm $KR_DIR_DT/*.lnk; fi
				if [ -f $KR_DIR_DT/$KR_NAME_URL ]; then cp $KR_DIR_DT/*.url $KR_DIR_LNK/BU.$HOSTNAME/DESKTOP/; rm $KR_DIR_DT/*.url; fi
			fi;;
		c) if [ -d $KR_DIR_LNK/COMP/$2 ]; then cp $KR_DIR_LNK/COMP/$2/*.* $KR_DIR_DT/; else virhe SHORTS dt $1 $2; fi;;
		l) if [ -d $KR_DIR_LNK/KTXT/$2 ]; then cp $KR_DIR_LNK/KTXT/$2/*.* $KR_DIR_DT/; else virhe SHORTS dt $1 $2; fi;;
		p) if [ -d $KR_DIR_LNK/PROJ/$2 ]; then cp $KR_DIR_LNK/PROJ/$2/*.* $KR_DIR_DT/; else virhe SHORTS dt $1 $2; fi;;
		u) if [ -d $KR_DIR_LNK/USER/$2 ]; then cp $KR_DIR_LNK/USER/$2/*.* $KR_DIR_DT/; else virhe SHORTS dt $1 $2; fi;;
		*) if [ -d $KR_DIR_LNK/PROJ/$1 ]; then cp $KR_DIR_LNK/PROJ/$1/*.* $KR_DIR_DT/; else virhe SHORTS dt $1 $2; fi;;
	esac
}

shorts_menu() {
	debug "SHORTS/MENU" "$1"
	if [ $VERBOSITY -ge $LEV_V ]; then tynnyri "MENU-$1"; fi
	case $1 in
		clr)
			cp $KR_DIR_AMENU/*.lnk $KR_DIR_LNK/BU.$HOSTNAME/MENU/
			cp $KR_DIR_UMENU/*.lnk $KR_DIR_LNK/BU.$HOSTNAME/MENU/
			;;
	esac
}

shorts_sendto() {
	debug "SHORTS/SENDTO" "$1 $2"
	if [ $VERBOSITY -ge $LEV_V ]; then tynnyri "S2-$1"; fi
	if [ -d $KR_DIR_SENDTO ]; then
		case $1 in
			clr) rm $KR_DIR_SENDTO/*.lnk;;
			def) cp $KR_DIR_LNK/SENDTO/default/*.lnk $KR_DIR_SENDTO/;;
			*) if [ -d $KR_DIR_LNK/BU.$HOSTNAME/SENDTO/$1 ]; then cp $KR_DIR_LNK/SENDTO/$1/*.lnk $KR_DIR_SENDTO/; else virhe SHORTS/SENDTO $1 $2; fi;;
		esac
	else
		virhe SHORTS no SENDTO directory 
	fi
}

shorts_startup() {
	debug "SHORTS/STARTUP" "$1 $2"
	if [ $VERBOSITY -ge $LEV_V ]; then tynnyri "SU-$1"; fi
	case $1 in
		clr)
			if [ -f $KR_DIR_STARTUP/$KR_NAME_STARTUP ]; then 
				cp $KR_DIR_STARTUP/*.lnk $KR_DIR_LNK/BU.$HOSTNAME/STARTUP/; rm $KR_DIR_STARTUP/*.lnk
			else virhe NO $KR_NAME_STARTUP found in $KR_DIR_STARTUP 
			fi;;
		def) cp $KR_DIR_LNK/STARTUP/default/*.lnk $KR_DIR_STARTUP/;;
		*) if [ -d $KR_DIR_LNK/STARTUP/$1 ]; then cp $KR_DIR_LNK/STARTUP/$1/*.lnk $KR_DIR_STARTUP/; fi;;
	esac
}

shorts() {
	debug "SHORTS/MAIN"
	if [ -d $KR_DIR_LNK ]; then
		if [ $VERBOSITY -ge $LEV_V ]; then tynnyri $1-$2-$3; fi
		case $1 in
			clr) tynnyri new SHORTS/CLR; shorts_menu clr; shorts_dt clr; shorts_startup clr;;
			dt) tynnyri new SHORTS/DT; shorts_dt c $HOSTNAME; shorts_dt l $2; shorts_dt p $3; shorts_dt u $USER;;
			st) tynnyri new SHORTS/ST; shorts_sendto $HOSTNAME; shorts_sendto $2;;
		esac
		if [ $VERBOSITY -ge $LEV_V ]; then tynnyri kick; fi
	else virhe no APPLNK directory
	fi
}
