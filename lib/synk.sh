#!/bin/bash
#synk.sh, L 24.3.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri SYNK; fi

synk_real() {
	debug SYNK real $1 $2
	if [ -f ~/$KR_DIR_HOST/../loc/sites/$2 ]; then . ~/$KR_DIR_HOST/../loc/sites/$2
		kaiku $1 $2
		#if [ $SYNK_PROTOCOL == "ssh" ]; then kaiku SYNK $SYNK_PROTOCOL; fi
		case $1 in
			ftp) echo "[[ KIR_SYNK ERR2 ]] ftp "$SYNK_PARAM" "$SYNK_USERNAME"@"$SYNK_HOSTNAME":"$SYNK_DDIR" "$SYNK_LDIR ;;
			ftp_upl) echo "[[ KIR_SYNK ERR2 ]] ftp "$SYNK_PARAM" "$SYNK_USERNAME"@"$SYNK_HOSTNAME":"$SYNK_DDIR" "$SYNK_LDIR ;;
			kaiku) echo "[[ KIR_SYNK ERR1 ]] "$SYNK_PARAM" "$SYNK_USERNAME"@"$SYNK_HOSTNAME":"$SYNK_DDIR" "$SYNK_LDIR" --exclude-from "$SYNK_EXCLUDE ;;  
			local) echo rsync $SYNK_PARAM $SYNK_DDIR $SYNK_LDIR --exclude-from ~/$KR_DIR_EXCL'/'$SYNK_EXCLUDE;;
			SSH) ssh $SYNK_USERNAME"@"$SYNK_HOSTNAME;;
			SYN)
				#if [ -f $1/backup.log ]; then tail -n 1 $1/backup.log; fi
				KR_LATEST_TODAY="today_maybe"
				bulog $SYNK_LDIR $HOSTNAME $SYNK_HOSTNAME
				#doesn't do backup runs if already backed up today (checkup happens in bulog)
				if [ $KR_LATEST_TODAY == "today_false" ]; then
					rsync $SYNK_PARAM $SYNK_USERNAME@$SYNK_HOSTNAME:$SYNK_DDIR $SYNK_LDIR --exclude-from ~/$KR_DIR_EXCL/$2
				else
					debug KOP $2
				fi;;
			scp) echo WinSCP;;
			sftp) echo SFTP;;
			upl) rsync $SYNK_PARAM $SYNK_LDIR $SYNK_USERNAME'@'$SYNK_HOSTNAME':'$SYNK_DDIR --exclude-from ~/$KR_DIR_EXCL/$SYNK_EXCLUDE;;
			wget) echo WGET;;
			winscp) echo WinSCP;;
			*) virhe SYNK real "-" "ei protokollaa!";;
		esac
	else
		if [ -f ~/$KR_DIR_HOST/../loc/sites/$2.sh ]; then
			. ~/$KR_DIR_HOST/../loc/sites/$2.sh $1
		else
			virhe SYNK $1 $2 "-" "yhteyttä ei tunnistettu!"
  	fi
  fi
}

synkronoi() {
	debug SYNK main $1 $2
	case $1 in
		ftp) synk_real SYN $2;;
		rsync) synk_real SYN $2;;
		sftp) synk_real SYN $2;;
		syn) synk_real SYN $2;;
		SYN) synk_real SYN $2;;
		sync) synk_real SYN $2;;
		SYNC) synk_real SYN $2;;
		synk) synk_real SYN $2;;
		SYNK) synk_real SYN $2;;
		ssh) synk_real SSH $2;;
		SSH) synk_real SSH $2;;
		upl) synk_real upl $2;;
		yh) synk_real SSH $2;;
		*) synk_real SYN $1;;
	esac
}
