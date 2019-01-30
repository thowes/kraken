#!/bin/bash
shorts_dt() {
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
		if [ -d $KR_DIR_LNK/PROJ/$1 ]; then \cp $KR_DIR_LNK/PROJ/$1/*.* $KR_DIR_DT/; else virhe "Directory .desktop_links not found for project" $1 $2; fi
	fi
}

shorts_clear() {
	kaiku "SHORTS/CLEAR" "$1"
	case $1 in
		all) shorts_clear menu; shorts_clear startup; shorts_clear desktop;;
		desktop)
			if [ -d $KR_DIR_BUA/DESKTOP/ ]; then
				case $(uname) in
					CYGWIN) if [ -f $KR_DIR_DT/$KR_NAME_LNK ]; then \cp $KR_DIR_DT/*.lnk $KR_DIR_BUA/DESKTOP/; \rm $KR_DIR_DT/*.lnk; fi;;
					Darwin) if [ -d $KR_DIR_DT/$KR_NAME_LNK ]; then \cp $KR_DIR_DT/*.app $KR_DIR_BUA/DESKTOP/; \rm $KR_DIR_DT/*.app; fi;;
					Ubuntu) if [ -f $KR_DIR_DT/$KR_NAME_LNK ]; then \cp $KR_DIR_DT/*.desktop $KR_DIR_BUA/DESKTOP/; \rm $KR_DIR_DT/*.desktop; fi;;
				esac
				if [ -f $KR_DIR_DT/$KR_NAME_URL ]; then \cp $KR_DIR_DT/*.url $KR_DIR_BUA/DESKTOP/; \rm $KR_DIR_DT/*.url; fi
			fi;;
		sendto) if [ -d $KR_DIR_SENDTO/ ]; then \cp $KR_DIR_SENDTO/*.lnk $KR_DIR_BUA/SENDTO/; \rm $KR_DIR_SENDTO/*.lnk; else virhe SHORTS no SENDTO directory; fi;;
		startup) if [ -f $KR_DIR_STARTUP/$KR_NAME_STARTUP ]; then \cp $KR_DIR_STARTUP/*.lnk $KR_DIR_BUA/STARTUP/; \rm $KR_DIR_STARTUP/*.lnk; fi;;
		menu)
			if [ -d $KR_DIR_BUA/MENU/ ]; then
				if [ -d $KR_DIR_AMENU ]; then \cp $KR_DIR_AMENU/*.lnk $KR_DIR_BUA/MENU/; else virhe shorts.sh:28 dir $KR_DIR_AMENU missing; fi
				if [ -d $KR_DIR_UMENU ]; then \cp $KR_DIR_UMENU/*.lnk $KR_DIR_BUA/MENU/; else virhe shorts.sh:29 dir $KR_DIR_UMENU missing; fi
				if [ -d $KR_DIR_CMENU ]; then \cp $KR_DIR_CMENU/*.lnk $KR_DIR_BUA/CMENU/; else virhe shorts.sh:29 dir $KR_DIR_CMENU missing; fi
				if [ -d $KR_DIR_PMENU ]; then \cp $KR_DIR_PMENU/*.lnk $KR_DIR_BUA/PMENU/; else virhe shorts.sh:29 dir $KR_DIR_PMENU missing; fi
			else virhe shorts.sh:30 dir $KR_DIR_BUA/MENU/ missing
			fi;;
		*) shorts_clear menu; shorts_clear desktop;;
	esac
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

shorts() {
	debug "SHORTS/MAIN"
	case $1 in
		clr) if [ -d $KR_DIR_LNK ]; then tynnyri new SHORTS/CLR; tyhjenna; else debug no APPLNK directory; fi;;
		dt) tynnyri new SHORTS/DT; shorts_dt $3 $2;;
		st) tynnyri new SHORTS/ST; debug shorts_sendto $HOSTNAME; shorts_startup $HOSTNAME; shorts_startup $2;;
	esac
}
