#!/bin/bash
#kraken.sh, L 17.8.2010
kraken() {
	case  $1 in
		l) echo "[[ KRAKEN "$USERNAME"@"$HOSTNAME" via "$VERKKO" ]]";;
		s) echo "[[ KRAKEN "$USERNAME"@"$HOSTNAME" via "$VERKKO" ]]"; compu_terminal $VERKKO;;
		*) echo $VERKKO;;
	esac
}

if [ -f ~/$2 ]; then
	. ~/$2
	CONTEXT=$1"_"$USECONTEXT

	# CONTEXT & ENVIRONMENT
	if [ -f $KR_DIR_LIB/kon.sh ]; then . $KR_DIR_LIB/kon.sh; fi

	#FUNCTIONS
	if [ -f $KR_DIR_LIB/kaiku.sh ]; then . $KR_DIR_LIB/kaiku.sh; fi

	# MODULES, FILE MANAGEMENT & BACKUP FUNCTIONS
	if [ $KR_DEBUG == "true" ]; then tynnyri new "KRAKEN/FLM /w"; fi
	if [ -f $KR_DIR_LIB/vers.sh ]; then . $KR_DIR_LIB/vers.sh; fi
	if [ -f $KR_DIR_LIB/ymp.sh ]; then . $KR_DIR_LIB/ymp.sh; fi
	case $KAYTTIS in
		cygwin) if [ -f $KR_DIR_LIB/tccm_cygwin.sh ]; then . $KR_DIR_LIB/tccm_cygwin.sh; fi;;
		darwin) if [ -f $KR_DIR_LIB/tccm_darwin.sh ]; then . $KR_DIR_LIB/tccm_darwin.sh; fi;;
		ubuntu) if [ -f $KR_DIR_LIB/tccm_ubuntu.sh ]; then . $KR_DIR_LIB/tccm_ubuntu.sh; fi;;
	esac
	if [ -f $KR_DIR_LIB/shorts.sh ]; then . $KR_DIR_LIB/shorts.sh; fi
	if [ -f $KR_DIR_LIB/uus.sh ]; then . $KR_DIR_LIB/uus.sh; fi
	if [ -f $KR_DIR_LIB/bulog.sh ]; then . $KR_DIR_LIB/bulog.sh; fi
	if [ -f $KR_DIR_LIB/kop.sh ]; then . $KR_DIR_LIB/kop.sh; fi
	if [ $KR_DEBUG == "true" ]; then tynnyri kick; fi

	# LOCAL
	if [ -f $KR_DIR_CFG/compu.sh ]; then . $KR_DIR_CFG/compu.sh; fi

	#KIRJASTOT
	if [ -f $KR_DIR_LIB/verkko.sh ]; then . $KR_DIR_LIB/verkko.sh; fi
	if [ -f $KR_DIR_LIB/proj.sh ]; then . $KR_DIR_LIB/proj.sh; fi

	#OTHER FUNCTIONS
	if [ $KR_DEBUG == "true" ]; then tynnyri new "KRAKEN/FUNK /w"; fi
	if [ -f $KR_DIR_LIB/drives.sh ]; then . $KR_DIR_LIB/drives.sh; fi
	if [ -f $KR_DIR_LIB/passu.sh ]; then . $KR_DIR_LIB/passu.sh; fi
	if [ -f $KR_DIR_LIB/synk.sh ]; then . $KR_DIR_LIB/synk.sh; fi
	if [ -f $KR_DIR_LIB/muok.sh ]; then . $KR_DIR_LIB/muok.sh; fi
	if [ -f $KR_DIR_LIB/reader.sh ]; then . $KR_DIR_LIB/reader.sh; fi
	if [ $KR_DEBUG == "true" ]; then tynnyri kick; fi

	#TOIMENPITEET
	if [ $BACKUPS == "true" ]; then
		case $CONTEXT in
			b_app) compu_app $APPNAME;;
			b_start) compu_start $CONTEXT;;
			*) kaiku KONTEXT $1 $CONTEXT;;
		esac 
	fi
	if [ $KR_DEBUG == "true" ]; then kraken s; fi
fi
cd
