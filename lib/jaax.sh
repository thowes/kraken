#!/bin/bash
#jaax.sh, L 11.6.2013/31.3.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri "JAAX"; fi

jaax_fl() {
	debug "JAAX/FL" "$1 $2"
	if [ $VERBOSITY -ge $LEV_V ]; then tynnyri "f-$1"; fi
	case $1 in
		clr) rm ~/$KR_DIR_FLZ/*.lnk; rm ~/$KR_DIR_FLZ/*.url;;
		l) if [ -d ~/$KR_DIR_LNK/LOC.FL/$2 ]; then cp ~/$KR_DIR_LNK/LOC.FL/$2/*.* ~/$KR_DIR_FLZ/; else virhe JAAX FL $1 $2; fi;;
		p) if [ -d ~/$KR_DIR_LNK/PROJ.FL/$2 ]; then cp ~/$KR_DIR_LNK/PROJ.FL/$2/*.* ~/$KR_DIR_FLZ/; else virhe JAAX FL $1 $2; fi;;
		*) if [ -d ~/$KR_DIR_LNK/PROJ.FL/$1 ]; then cp ~/$KR_DIR_LNK/PROJ.FL/$1/*.* ~/$KR_DIR_FLZ/; else virhe JAAX FL $1 $2; fi;;
	esac
}

jaax_ql() {
	debug "JAAX/QL" "$1 $2"
	if [ $VERBOSITY -ge $LEV_V ]; then tynnyri "$1-$2"; fi
	case $1 in
		clr) rm ~/$KR_DIR_QL/*.lnk;;
		c) if [ -d ~/$KR_DIR_LNK/COMPU/$2 ]; then cp ~/$KR_DIR_LNK/COMPU/$2/*.lnk ~/$KR_DIR_QL/; else virhe JAAX ql $1 $2; fi;;
		l) if [ -d ~/$KR_DIR_LNK/LOC.QL/$2 ]; then cp ~/$KR_DIR_LNK/LOC.QL/$2/*.lnk ~/$KR_DIR_QL/; else virhe JAAX ql $1 $2; fi;;
		p) if [ -d ~/$KR_DIR_LNK/PQL/$2 ]; then cp ~/$KR_DIR_LNK/PQL/$2/*.lnk ~/$KR_DIR_QL/; else virhe JAAX ql $1 $2; fi;;
		u) if [ -d ~/$KR_DIR_LNK/USER/$2 ]; then cp ~/$KR_DIR_LNK/USER/$2/*.lnk ~/$KR_DIR_QL/; else virhe JAAX ql $1 $2; fi;;
		*) if [ -d ~/$KR_DIR_LNK/PQL/$1 ]; then cp ~/$KR_DIR_LNK/PQL/$1/*.lnk ~/$KR_DIR_QL/; else virhe JAAX ql $1 $2; fi;;
	esac
}

jaax_sendto() {
	debug "JAAX/SENDTO" "$1 $2"
	if [ $VERBOSITY -ge $LEV_V ]; then tynnyri "S2-$1"; fi
	case $1 in
		clr) rm ~/$KR_DIR_SENDTO/*.lnk;;
		def) cp ~/$KR_DIR_LNK/SENDTO/default/*.lnk ~/$KR_DIR_SENDTO/;;
		*) if [ -d ~/$KR_DIR_LNK/SENDTO/$1 ]; then cp ~/$KR_DIR_LNK/SENDTO/$1/*.lnk ~/$KR_DIR_SENDTO/; else virhe JAAX/SENDTO $1 $2; fi
	esac
}

jaax_startup() {
	debug "JAAX/STU" "$1 $2"
	if [ $VERBOSITY -ge $LEV_V ]; then tynnyri "SU-$1"; fi
	case $1 in
		clr) rm ~/$KR_DIR_STARTUP/*.lnk;;
		def) cp ~/$KR_DIR_LNK/STARTUP/default/*.lnk ~/$KR_DIR_STARTUP/;;
		*) if [ -d ~/$KR_DIR_LNK/STARTUP/$1 ]; then cp ~/$KR_DIR_LNK/STARTUP/$1/*.lnk ~/$KR_DIR_STARTUP/; else virhe JAAX/STARTUP $1 $2; fi;;
	esac
}

jaax() {
	debug "JAAX/MAIN"
	if [ $VERBOSITY -ge $LEV_V ]; then tynnyri $1-$2-$3; fi
	case $1 in
		air) jaax_main clr; jaax_ql air;;
		clr) tynnyri new JAAX/CLR; jaax_fl clr; jaax_ql clr ql; jaax_startup clr;;
		fl) tynnyri new JAAX/FL; jaax_fl l $2; jaax_fl p $3;;
		ql) tynnyri new JAAX/QL; jaax_ql c $HOSTNAME; jaax_ql l $2; jaax_ql p $3; jaax_ql u $USER;;
		st) tynnyri new JAAX/ST; jaax_sendto win7; jaax_sendto $HOSTNAME; jaax_startup $HOSTNAME;;
	esac
	if [ $VERBOSITY -ge $LEV_V ]; then tynnyri kick; fi
}
