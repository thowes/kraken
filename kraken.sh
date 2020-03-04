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

	# LOCAL
	if [ -f $KR_DIR_CFG/compu.sh ]; then . $KR_DIR_CFG/compu.sh; fi

	#KIRJASTOT
	if [ -f $KR_DIR_LIB/kr_network.sh ]; then . $KR_DIR_LIB/kr_network.sh; fi
	if [ -f $KR_DIR_LIB/../bin/valitse ]; then . $KR_DIR_LIB/../bin/valitse; fi
	if [ -f $KR_DIR_LIB/val.sh ]; then . $KR_DIR_LIB/val.sh; fi
	if [ -f $KR_DIR_LIB/proj.sh ]; then . $KR_DIR_LIB/proj.sh; fi

	#OTHER FUNCTIONS
	if [ $KR_DEBUG == "true" ]; then tynnyri new "KRAKEN/FUNK /w"; fi
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
