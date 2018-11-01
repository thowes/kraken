#!/bin/bash
running() {
	KR_OUTPUT=false
	case $(uname) in
		*CYGWIN*)
			KR_APPCHECKER_RUNNING=$(tasklist | tr -s " " | awk '{print $1 " " $3}' | \grep $1.exe)
			case $KR_APPCHECKER_RUNNING in
				*Console*) KR_OUTPUT=true;;
				*Session*) KR_OUTPUT=true;;
				*Services*) KR_OUTPUT=true;;
			esac;;
		*) # not functional yet
			KR_APPCHECKER_NUMBER=$(ps aux | \grep -v grep | \grep $1 | wc -l)
			case "$KR_APPCHECKER_NUMBER" in
				*0) KR_OUTPUT=false;;
				*) KR_OUTPUT=true;;
			esac
	esac
	echo $KR_OUTPUT
}