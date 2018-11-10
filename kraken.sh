#!/bin/bash
kraken() {
	case  $1 in
		l) echo "[[ KRAKEN "$USERNAME"@"$HOSTNAME" via "$KR_NETWORK" ]]";;
		s) echo "[[ KRAKEN "$USERNAME"@"$HOSTNAME" via "$KR_NETWORK" ]]"; compu_terminal $KR_NETWORK;;
		*) echo $KR_NETWORK;;
	esac
}

if [ -f $2 ]; then
	. $2
	CONTEXT=$1"_"$USECONTEXT

	#FUNCTIONS
	if [ -f $KR_DIR_LIB/kaiku.sh ]; then . $KR_DIR_LIB/kaiku.sh; fi

	# MODULES, FILE MANAGEMENT & BACKUP FUNCTIONS
	if [ $KR_DEBUG == "true" ]; then tynnyri new "KRAKEN/FLM /w"; fi
	if [ -f $KR_DIR_LIB/vers.sh ]; then . $KR_DIR_LIB/vers.sh; fi
	if [ -f $KR_DIR_LIB/ymp.sh ]; then . $KR_DIR_LIB/ymp.sh; fi
	if [ -f $KR_DIR_LIB/tccm.sh ]; then . $KR_DIR_LIB/tccm.sh; fi
	if [ -f $KR_DIR_LIB/shorts.sh ]; then . $KR_DIR_LIB/shorts.sh; fi
	if [ -f $KR_DIR_LIB/uus.sh ]; then . $KR_DIR_LIB/uus.sh; fi
	if [ -f $KR_DIR_LIB/bulog.sh ]; then . $KR_DIR_LIB/bulog.sh; fi
	if [ -f $KR_DIR_LIB/kop.sh ]; then . $KR_DIR_LIB/kop.sh; fi
	#if [ -f $KR_DIR_LIB/../bin/running ]; then . $KR_DIR_LIB/../bin/running; fi
	if [ $KR_DEBUG == "true" ]; then tynnyri kick; fi

	# LOCAL
	if [ -f $KR_DIR_CFG/compu.sh ]; then . $KR_DIR_CFG/compu.sh; fi

	#KIRJASTOT
	if [ -f $KR_DIR_LIB/verkko.sh ]; then . $KR_DIR_LIB/verkko.sh; fi
	if [ -f $KR_DIR_LIB/proj.sh ]; then . $KR_DIR_LIB/proj.sh; fi

	#OTHER FUNCTIONS
	if [ $KR_DEBUG == "true" ]; then tynnyri new "KRAKEN/FUNK /w"; fi
	#if [ -f $KR_DIR_LIB/drives.sh ]; then . $KR_DIR_LIB/drives.sh; fi
	if [ -f $KR_DIR_LIB/synk.sh ]; then . $KR_DIR_LIB/synk.sh; fi
	if [ -f $KR_DIR_LIB/func.sh ]; then . $KR_DIR_LIB/func.sh; fi
	if [ $KR_DEBUG == "true" ]; then tynnyri kick; fi

	#TOIMENPITEET
	if [ $KR_BACKUPS == "true" ]; then
		case $CONTEXT in
			b_app) compu_app $APPNAME; exit;;
			b_start) compu_start $CONTEXT;;
			*) debug KONTEXT $1 $CONTEXT;;
		esac 
	fi
	if [ $KR_DEBUG == "true" ]; then kraken s; fi
fi
\cd
