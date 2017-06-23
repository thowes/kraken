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
	b_app)
		BACKUPS="false"
		VERBOSITY=$LEV_V
		;;
	b_proj)
		BACKUPS="true"
		VERBOSITY=$LEV_V
		;;
	b_recon)
		BACKUPS="true"
		VERBOSITY=$LEV_N
		;;
	b_start)
		BACKUPS="true"
		VERBOSITY=$LEV_N
		;;
	b_terminal)
		BACKUPS="false"
		VERBOSITY=$LEV_N
		;;
	b_verbose)
		BACKUPS="true"
		VERBOSITY=$LEV_V
		;;
	*)
		BACKUPS="false"
		VERBOSITY=$LEV_P
		;;
esac
if [ $KR_DEBUG == "true" ]; then echo "[[ KRAKEN/KON $CONTEXT ($LEV_V) bu:$BACKUPS ]]"; fi
