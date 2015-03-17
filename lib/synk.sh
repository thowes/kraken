#!/bin/bash
#synk.sh, L 24.3.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri SYNK; fi

synk_real() {
	debug SYNK real $1 $2
	if [ -f ~/$KR_DIR_CFG/loc/sites/$2 ]; then . ~/$KR_DIR_CFG/loc/sites/$2
		kaiku $1 $2
		#if [ $SYNK_PROTOCOL == "ssh" ]; then kaiku SYNK $SYNK_PROTOCOL; fi
		case $1 in
			ftp) echo "[[ KIR_SYNK ERR2 ]] ftp "$SYNK_PARAM" "$SYNK_USERNAME"@"$SYNK_HOSTNAME":"$SYNK_DDIR" "$SYNK_LDIR ;;
			ftp_upl) echo "[[ KIR_SYNK ERR2 ]] ftp "$SYNK_PARAM" "$SYNK_USERNAME"@"$SYNK_HOSTNAME":"$SYNK_DDIR" "$SYNK_LDIR ;;
			kaiku) echo "[[ KIR_SYNK ERR1 ]] "$SYNK_PARAM" "$SYNK_USERNAME"@"$SYNK_HOSTNAME":"$SYNK_DDIR" "$SYNK_LDIR" --exclude-from "$SYNK_EXCLUDE ;;  
			local) echo rsync $SYNK_PARAM $SYNK_DDIR $SYNK_LDIR --exclude-from ~/$KR_DIR_CFG'/exclude/'$SYNK_EXCLUDE;;
			SSH) ssh $SYNK_USERNAME"@"$SYNK_HOSTNAME;;
			SYN) rsync $SYNK_PARAM $SYNK_USERNAME@$SYNK_HOSTNAME:$SYNK_DDIR $SYNK_LDIR --exclude-from ~/$KR_DIR_EXCL/$2;;
			scp) echo WinSCP;;
			sftp) echo SFTP;;
			upl) rsync $SYNK_PARAM $SYNK_LDIR $SYNK_USERNAME'@'$SYNK_HOSTNAME':'$SYNK_DDIR --exclude-from ~/$KR_DIR_EXCL/$SYNK_EXCLUDE;;
			wget) echo WGET;;
			winscp) echo WinSCP;;
			*) virhe SYNK real "-" "ei protokollaa!";;
		esac
	else
		if [ -f ~/$KR_DIR_CFG/loc/sites/$2.sh ]; then
			. ~/$KR_DIR_CFG/loc/sites/$2.sh $1
		else
			virhe SYNK $1 $2 "-" "yhteyttä ei tunnistettu!"
  	fi
  fi
}

synk_wget() {
	#non-verbose, adjust-extensions, page-requisites, timestamping, convert-links
	case $1 in
		page) wget -nv -E -p -N -k $2;;
		pics) wget -nv -t 2 -nc -E -p -k -N $2;;
		site) wget -nv -E -p -N -k $2;;
		*) wget -nv -E -p -N -k $1;;
	esac
}

synkronoi() {
	debug SYNK main $1 $2
	case $1 in
		ftp) synk_real SYN $2;;
		page) synk_wget page $2;;
		rsync) synk_real SYN $2;;
		sftp) synk_real SYN $2;;
		site) synk_wget site $2;;
		syn) synk_real SYN $2;;
		SYN) synk_real SYN $2;;
		sync) synk_real SYN $2;;
		SYNC) synk_real SYN $2;;
		synk) synk_real SYN $2;;
		SYNK) synk_real SYN $2;;
		ssh) synk_real SSH $2;;
		SSH) synk_real SSH $2;;
		upl) synk_real upl $2;;
		wget) synk_wget page $1;;
		yh) synk_real SSH $2;;
		*) synk_real SYN $1;;
	esac
}
