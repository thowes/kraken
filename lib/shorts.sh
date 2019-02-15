#!/bin/bash
shorts_desktop() {
	debug "SHORTS/DT" "$1 $2 $3"
	if [ -d $KR_DIR_LNK/ ]; then
		if [ -d $KR_DIR_LNK/COMP/$HOSTNAME ]; then \cp $KR_DIR_LNK/COMP/$HOSTNAME/*.* $KR_DIR_DT/; else virhe "SHORTS/dt: dir" $KR_DIR_LNK/COMP/$HOSTNAME "not found."; fi
		if [ -d $KR_DIR_LNK/USER/$USER ]; then \cp $KR_DIR_LNK/USER/$USER/*.* $KR_DIR_DT/; else virhe "SHORTS/dt: dir" $KR_DIR_LNK/USER/$USER "not found."; fi
		if [ -d $KR_DIR_LNK/KTXT/$KR_NETWORK/ ]; then \cp $KR_DIR_LNK/KTXT/$KR_NETWORK/*.* $KR_DIR_DT/; else virhe "SHORTS/dt: dir" $KR_DIR_LNK/KTXT/$KR_NETWORK "not found."; fi
		if [ -d $KR_DIR_LNK/PROG/$1 ]; then \cp $KR_DIR_LNK/PROG/$1/*.* $KR_DIR_DT/; fi #else virhe "SHORTS dir dt-prog" $1 $2 "not found."; fi
	else virhe "SHORTS/dt dir" $KR_DIR_LNK "not found."; fi
	if [ -d $KR_DIRPO/.desktop_links ]; then
		\cp $KR_DIRPO/.desktop_links/*.* $KR_DIR_DT/; 
	else
		if [ -d $KR_DIR_LNK/PROJ/$1 ]; then \cp $KR_DIR_LNK/PROJ/$1/*.* $KR_DIR_DT/; else virhe "Directory .desktop_links not found for project" p:$1 k:$2; fi
	fi
}

shorts_sendto() {
	debug "SHORTS/SENDTO" "$1 $2"
	if [ -d $KR_DIR_SENDTO ]; then
		case $1 in
			def) \cp $KR_DIR_LNK/SENDTO/default/*.lnk $KR_DIR_SENDTO/;;
			*) if [ -d $KR_DIR_BUA/SENDTO/$1 ]; then \cp $KR_DIR_BUA/SENDTO/$1/*.lnk $KR_DIR_SENDTO/; else virhe SHORTS/SENDTO $1 $2; fi;;
		esac
	else
		virhe SHORTS no SENDTO directory 
	fi
}

shorts_startup() {
	debug "SHORTS/STARTUP" "$1 $2"
	case $1 in
		def) \cp $KR_DIR_LNK/STARTUP/default/*.lnk $KR_DIR_STARTUP/;;
		*) if [ -d $KR_DIR_LNK/STARTUP/$1 ]; then \cp $KR_DIR_LNK/STARTUP/$1/*.lnk $KR_DIR_STARTUP/; fi;;
	esac
}

KR_DIR_BUA=$(asetus dir:bua)
KR_DIR_DT=$(asetus dir:dt)
KR_DIR_LNK=$(asetus dir:lnk)
KR_DIR_SENDTO=$(asetus dir:sendto)
KR_DIR_STARTUP=$(asetus dir:startup)
shorts() {
	debug "SHORTS"
	case $1 in
		d*t*) tynnyri new SHORTS/DT; shorts_desktop $3 $2;;
		sendto) tynnyri new SHORTS/STO; debug shorts_sendto $HOSTNAME;;
		st) tynnyri new SHORTS/ST; debug shorts_sendto $HOSTNAME; shorts_startup $HOSTNAME; shorts_startup $2;;
		startup) tynnyri new SHORTS/STU; shorts_startup $HOSTNAME; shorts_startup $2;;
		*) if [ -d $KR_DIR_LNK ]; then tynnyri new SHORTS/CLR; tyhjenna; else debug no APPLNK directory; fi;;
	esac
}
