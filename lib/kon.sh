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
		debug BACKUPS="false"
		;;
	b_app)
		debug BACKUPS="true"
		;;
	b_proj)
		debug BACKUPS="true"
		;;
	b_recon)
		debug BACKUPS="true"
		;;
	b_start)
		debug BACKUPS="true"
		;;
	b_terminal)
		debug BACKUPS="false"
		;;
	b_verbose)
		debug BACKUPS="true"
		;;
	*)
		debug BACKUPS="false"
		;;
esac
if [ $KR_DEBUG == "true" ]; then echo "[[ KRAKEN/KON $CONTEXT bu:$BACKUPS ]]"; fi
