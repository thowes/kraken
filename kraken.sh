#!/bin/bash
#kraken.sh, L 17.8.2010
kraken() {
  echo "[[ KRAKEN "$USER"@"$HOSTNAME""$HOME" via "$VERKKO" ]]"
	todos_kon $VERKKO
}

if [ -d $KR_DIR_HOST ]; then
	BACKUPS="false"
	CONTEXT=$1"_"$USECONTEXT
	VERBOSITY="1"
	VERKKO="NADA"

	# CONTEXT & ENVIRONMENT
	if [ -f $KR_DIR_LIB/kon.sh ]; then . $KR_DIR_LIB/kon.sh; fi

	#FUNCTIONS
	if [ -f $KR_DIR_LIB/kaiku.sh ]; then . $KR_DIR_LIB/kaiku.sh; fi

	# MODULES, FILE MANAGEMENT & BACKUP FUNCTIONS
	if [ $VERBOSITY -ge $LEV_V ]; then tynnyri new "KRAKEN/FLM /w"; fi
	if [ -f $KR_DIR_LIB/vers.sh ]; then . $KR_DIR_LIB/vers.sh; fi
	if [ -f $KR_DIR_LIB/tccm.sh ]; then . $KR_DIR_LIB/tccm.sh; fi
	if [ -f $KR_DIR_LIB/jaax.sh ]; then . $KR_DIR_LIB/jaax.sh; fi
	if [ -f $KR_DIR_LIB/uus.sh ]; then . $KR_DIR_LIB/uus.sh; fi
	if [ -f $KR_DIR_LIB/kop.sh ]; then . $KR_DIR_LIB/kop.sh; fi
	if [ $VERBOSITY -ge $LEV_V ]; then tynnyri kick; fi

	# LOCAL
	if [ -f $KR_DIR_HOST/compu.sh ]; then . $KR_DIR_HOST/compu.sh; fi

	#KIRJASTOT
	if [ -f $KR_DIR_LIB/ymp.sh ]; then . $KR_DIR_LIB/ymp.sh; fi
	if [ -f $KR_DIR_LIB/verkko.sh ]; then . $KR_DIR_LIB/verkko.sh; fi
	if [ -f $KR_DIR_LIB/proj.sh ]; then . $KR_DIR_LIB/proj.sh; fi

	#OTHER FUNCTIONS
	if [ $VERBOSITY -ge $LEV_V ]; then tynnyri new "KRAKEN/FUNK /w"; fi
	if [ -f $KR_DIR_LIB/drives.sh ]; then . $KR_DIR_LIB/drives.sh; fi
	if [ -f $KR_DIR_LIB/passu.sh ]; then . $KR_DIR_LIB/passu.sh; fi
	if [ -f $KR_DIR_LIB/synk.sh ]; then . $KR_DIR_LIB/synk.sh; fi
	if [ -f $KR_DIR_LIB/muok.sh ]; then . $KR_DIR_LIB/muok.sh; fi
	if [ -f $KR_DIR_LIB/reader.sh ]; then . $KR_DIR_LIB/reader.sh; fi
	if [ $VERBOSITY -ge $LEV_V ]; then tynnyri kick; fi

	#TOIMENPITEET
	if [ $BACKUPS == "true" ]; then compu_toimpide $CONTEXT; fi
	if [ $VERBOSITY -ge $LEV_N ]; then kraken; fi
fi
cd
