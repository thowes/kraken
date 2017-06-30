#!/bin/bash
#tccm.sh. L 2.4.2013
if [ $KR_DEBUG == "true" ]; then tynnyri TCCM; fi
KR_PASSU=passu1
KR_SALIS=passu2

tccm() {
	debug TTCM $1 $2 $3
	case $1 in
		all) tc -d;;
		c) tccm mt $2 $3;;
		con) tccm mt $2 $3;;
		d) tccm dm $2;;
		da) tccm all;;
		dc) tccm dm $2;;
		dm) tc -d l$2;;
		dis) tccm d $2;;
		info) tcc_kr_info;;
		key)
			if [ $VERBOSITY -ge $LEV_V ]; then tynnyri $3; fi
			tc -m ts $3 -p $KR_PASSU -k $4 /Volumes/l$2
			KR_TC_NAME=$(echo $3|awk -F "." '{print $1}')
			#if [ -f /Volumes/$2/$KR_TC_NAME.sh ]; then . /Volumes/$2/$KR_TC_NAME.sh; else echo NO: /Volumes/l$2/$KR_TC_NAME.sh; fi
			;;
		m) tccm mt $2 $3;;
		mnt) tccm mt $2 $3;;
		mt)
			if [ $VERBOSITY -ge $LEV_V ]; then tynnyri $3; fi
			tc -m ts $3 -p $KR_SALIS -k $4 /Volumes/l$2
			KR_TC_NAME=$(echo $3|awk -F "." '{print $1}')
			#if [ -f /Volumes/$2/$KR_TC_NAME.sh ]; then . /Volumes/$2/$KR_TC_NAME.sh; else echo NO: /Volumes/l$2/$KR_TC_NAME.sh; fi
			;;
		n) tccm new $2 $3;;
		new) echo tc /new /v $2 $3;;
		pwd) tcc_passu;;
		ro)
			if [ $VERBOSITY -ge $LEV_V ]; then tynnyri $3; fi
			tc -m ro $3 -p $KR_PASSU -k $4 /Volumes/l$2
			KR_TC_NAME=$(echo $3|awk -F "." '{print $1}')
			#if [ -f /Volumes/$2/$KR_TC_NAME.sh ]; then . /Volumes/$2/$KR_TC_NAME.sh; else echo NO: /Volumes/l$2/$KR_TC_NAME.sh; fi
			;;
		v1)
			if [ $VERBOSITY -ge $LEV_V ]; then tynnyri $3; fi
			tc -m ts $3 -p $KR_PASSU /Volumes/l$2
			KR_TC_NAME=$(echo $3|awk -F "." '{print $1}')
			#if [ -f /Volumes/$2/$KR_TC_NAME.sh ]; then . /Volumes/$2/$KR_TC_NAME.sh; else echo NO: /Volumes/l$2/$KR_TC_NAME.sh; fi
			;;
		v2)
			if [ $VERBOSITY -ge $LEV_V ]; then tynnyri $3; fi
			tc -m ts $3 -p $KR_SALIS /Volumes/l$2
			KR_TC_NAME=$(echo $3|awk -F "." '{print $1}')
			#if [ -f /Volumes/$2/$KR_TC_NAME.sh ]; then . /Volumes/$2/$KR_TC_NAME.sh; else echo NO: /Volumes/l$2/$KR_TC_NAME.sh; fi
			;;
		wipe) KR_PASSU=passu1; KR_SALIS=passu2;;
		*) tccm all;;
	esac
}
