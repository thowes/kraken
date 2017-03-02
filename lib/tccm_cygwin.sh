#!/bin/bash
#tccm.sh, L 2.4.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri TCCM; fi
KR_PASSU=passu1
KR_SALIS=passu2

tccm() {
	debug TTCM $1 $2 $3
	case $1 in
		all) tc /q /s /d;;
		c) tccm mt $2 $3;;
		con) tccm mt $2 $3;;
		d) tccm dm $2;;
		da) tccm all;;
		dc) tccm dm $2;;
		dm) tc /q /s /d $2;;
		dis) tccm d $2;;
		info) tcc_kr_info;;
		key)
			if [ $VERBOSITY -ge $LEV_V ]; then tynnyri $3; fi
			tc /l$2 /q /s /m ts /v $3 /p $KR_PASSU /k $4
			KR_TC_NAME=$(echo $3|awk -F "." '{print $1}')
			if [ -f /cygdrive/$2/$KR_TC_NAME.sh ]; then . /cygdrive/$2/$KR_TC_NAME.sh; else echo NO: /cygdrive/$2/$KR_TC_NAME.sh; fi
			;;
		m) tccm mt $2 $3;;
		mnt) tccm mt $2 $3;;
		mt)
			if [ $VERBOSITY -ge $LEV_V ]; then tynnyri $3; fi
			tc /l$2 /q /s /m ts /v $3 /p $KR_SALIS /k $4
			KR_TC_NAME=$(echo $3|awk -F "." '{print $1}')
			if [ -f /cygdrive/$2/$KR_TC_NAME.sh ]; then . /cygdrive/$2/$KR_TC_NAME.sh; else echo NO: /cygdrive/$2/$KR_TC_NAME.sh; fi
			;;
		pwd) tcc_passu;;
		ro)
			if [ $VERBOSITY -ge $LEV_V ]; then tynnyri $3; fi
			tc /l$2 /q /s /m ro /v $3 /p $KR_PASSU /k $4
			KR_TC_NAME=$(echo $3|awk -F "." '{print $1}')
			if [ -f /cygdrive/$2/$KR_TC_NAME.sh ]; then . /cygdrive/$2/$KR_TC_NAME.sh; else echo NO: /cygdrive/$2/$KR_TC_NAME.sh; fi
			;;
		rw) tccm key $2 $3 $4;;
		v2)
			if [ $VERBOSITY -ge $LEV_V ]; then tynnyri $3; fi
			tc /l$2 /q /s /v $3 /p $KR_SALIS
			KR_TC_NAME=$(echo $3|awk -F "." '{print $1}')
			if [ -f /cygdrive/$2/$KR_TC_NAME.sh ]; then . /cygdrive/$2/$KR_TC_NAME.sh; else echo NO: /cygdrive/$2/$KR_TC_NAME.sh; fi
			;;
		vault)
			if [ $VERBOSITY -ge $LEV_V ]; then tynnyri $3; fi
			tc /l$2 /q /s /v $3 /p $KR_PASSU
			KR_TC_NAME=$(echo $3|awk -F "." '{print $1}')
			if [ -f /cygdrive/$2/$KR_TC_NAME.sh ]; then . /cygdrive/$2/$KR_TC_NAME.sh; else echo NO: /cygdrive/$2/$KR_TC_NAME.sh; fi
			;;
		wipe) KR_PASSU=passu1; KR_SALIS=passu2;;
		*) tccm all;;
	esac
}
