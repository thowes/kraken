#!/bin/bash
if [ $KR_DEBUG == "true" ]; then tynnyri SYNK; fi

synk_real() {
	debug SYNK real $1 $2
	if [ -f $KR_DIR_SITES/$2 ]; then . $KR_DIR_SITES/$2
		kaiku $1 $2
		case $1 in
			ssh) ssh $SYNK_USERNAME"@"$SYNK_HOSTNAME;;
			syn) if [ -d $SYNK_LDIR ]; then if [ -f $KR_DIR_EXCL/$2 ]; then
					#if [ -f $1/backup.log ]; then tail -n 1 $1/backup.log; fi
					KR_LATEST_TODAY="today_false"
					#bulog_add $SYNK_LDIR $HOSTNAME $SYNK_HOSTNAME
					#doesn't do backup runs if already backed up today (checkup happens in bulog)
					if [ $KR_LATEST_TODAY == "today_false" ]; then
						rsync $SYNK_PARAM $SYNK_USERNAME@$SYNK_HOSTNAME:$SYNK_DDIR $SYNK_LDIR --exclude-from $KR_DIR_EXCL/$2
					else
						debug KOP $2
					fi
				else virhe NOT FOUND exclude file; fi; else virhe NOT FOUND local dir; fi;;
			upl) rsync $SYNK_PARAM $SYNK_L_UP $SYNK_USERNAME'@'$SYNK_HOSTNAME':'$SYNK_D_UP --exclude-from $KR_DIR_EXCL/$2;;
			*) synk_real syn $2;; #virhe SYNK real "-" "no protocol!";;
		esac
	else
		if [ -f $KR_DIR_SITES/$2.sh ]; then
			. $KR_DIR_SITES/$2.sh $1
		else
			virhe SYNK $1 $2 "-" "connection not recognized!"
  	fi
  fi
}

synkronoi() {
	kaiku SYNK main $1 $2
	case $1 in
		#rsync) synk_real SYN $2;;
		syn) synk_real SYN $2;;
		SYN) synk_real SYN $2;;
		#sync) synk_real SYN $2;;
		#SYNC) synk_real SYN $2;;
		#synk) synk_real SYN $2;;
		#SYNK) synk_real SYN $2;;
		ssh) synk_real ssh $2;;
		#SSH) synk_real ssh $2;;
		upl) synk_real upl $2;;
		*) synk_real SYN $1;;
	esac
}
