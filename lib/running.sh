#!/bin/bash
running() {
	if [ -f $KR_DIR_TEMP/tl.lst ]; then
		KR_OUTPUT=false
		case $KAYTTIS in
			cygwin)
				KR_APPCHECKER_RUNNING=$(tasklist | tr -s " " | awk '{print $1 " " $3}' | grep $1.exe)
				case $KR_APPCHECKER_RUNNING in
					*Console*) KR_OUTPUT=true;;
					*Session*) KR_OUTPUT=true;;
					*Services*) KR_OUTPUT=true;;
				esac;;
			*) # not functional yet
				KR_APPCHECKER_NUMBER=$(ps aux | grep -v grep | grep $1 | wc -l)
				case "$KR_APPCHECKER_NUMBER" in
					*0) KR_OUTPUT=false;;
					*) KR_OUTPUT=true;;
				esac
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