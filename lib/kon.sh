#!/bin/bash
#kon.sh, L 2.4.2013
LEV_Z="0"
LEV_S="1"
LEV_P="2"
LEV_N="3"
LEV_V="5"
LEV_D="6"
LEV_F="9"

case $CONTEXT in
	b_)
		BACKUPS="false"
		VERBOSITY=$LEV_N
		;;
	b_proj)
		BACKUPS="true"
		VERBOSITY=$LEV_V
		;;
	b_recon)
		BACKUPS="true"
		VERBOSITY=$LEV_V
		;;
	b_start)
		BACKUPS="true"
		VERBOSITY=$LEV_N
		;;
	*)
		BACKUPS="false"
		VERBOSITY=$LEV_P
		;;
esac
if [ $VERBOSITY -ge $LEV_V ]; then echo "[[ KRAKEN/KON $CONTEXT ($LEV_V) bu:$BACKUPS ]]"; fi
