#!/bin/bash
#vker.sh, L 24.5.2007/8.7.2015
if [ $KR_DEBUG == "true" ]; then tynnyri VKER; fi

vker() {
	cd
	case $1 in
		#bg) varko /system/backgrounds bg;;
		local)
			tynnyri new VKER
			#vker bg
			vker logs
			tynnyri kick
			;;
		logs)
			#varko ~/rails/my_app/logs my_appLogs
			;;
		*) virhe VKER "$1 not recognized!";;
	esac
}

