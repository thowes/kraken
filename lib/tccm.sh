#!/bin/bash
#tccm.sh. L 2.4.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri TCCM; fi
KR_PASSU=passu1

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
		key) tynnyri $3; echo tc /l$2 /q /s /v $3 /p $KR_PASSU /k $KR_DIR_KEYS/$4;;
		m) tccm mt $2 $3;;
		mnt) tccm mt $2 $3;;
		mt) tynnyri $3; tc /l$2 /q /s /v $3 /p $KR_PASSU;;
		n) tccm new $2 $3;;
		new) echo tc /new /v $2 $3;;
		pwd) tcc_passu;;
		vault) tccm mt $2 $3;;
		wipe) KR_PASSU=passu1;;
		*) tccm all;;
	esac
}
