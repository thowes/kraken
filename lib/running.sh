#!/bin/bash
running() {
	if [ -f $KR_DIR_TEMP/tl.lst ]; then
		KR_OUTPUT=false
		case $KAYTTIS in
			cygwin)
				KR_APPCHECKER_RUNNING=$(cat -v $KR_DIR_TEMP/tl.lst | grep $1.exe)
				case $KR_APPCHECKER_RUNNING in
					*Console*) KR_OUTPUT=true;;
					*Session*) KR_OUTPUT=true;;
					*Services*) KR_OUTPUT=true;;
				esac;;
			*) # not functional yet
				KR_APPCHECKER_NUMBER=$(cat -v $KR_DIR_TEMP/tl.lst | grep $1 | wc -l)
				if [ $KR_APPCHECKER_NUMBER != 0 ]; then KR_OUTPUT=true; fi;;
		esac
		echo $KR_OUTPUT
	else
		case $KAYTTIS in
			cygwin) tasklist | tr -s " " | awk '{print $1 " " $3}' > $KR_DIR_TEMP/tl.lst;;
			*) ps aux | tr -s " " | awk '{print $11 $12}' > $KR_DIR_TEMP/tl.lst;;
		esac
		running $1
		if [ -f $KR_DIR_TEMP/tl.lst ]; then rm $KR_DIR_TEMP/tl.lst; fi
	fi
}