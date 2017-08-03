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
		;;
	b_app)
		BACKUPS="true"
		;;
	b_proj)
		BACKUPS="true"
		;;
	b_recon)
		BACKUPS="true"
		;;
	b_start)
		BACKUPS="true"
		;;
	b_terminal)
		BACKUPS="false"
		;;
	b_verbose)
		BACKUPS="true"
		;;
	*)
		BACKUPS="false"
		;;
esac
if [ $KR_DEBUG == "true" ]; then echo "[[ KRAKEN/KON $CONTEXT bu:$BACKUPS ]]"; fi
