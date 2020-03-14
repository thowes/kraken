#!/bin/bash

# this function is a tool for keeping projects automatically updated if they use git.
# update (pull) project if locally up to date.
projekti_update() {
	KRN_PROJ_ST_NEW=$(projekti-status)
	case $KRN_PROJ_ST_NEW in
		*Up-to-date*) if [ $KR_NETWORK != "NADA" ]; then kaiku "PROJ_UPD:" $KRN_PROJ_ST_NEW; compu_secu; git pull; else virhe "PROJ_UPD:" "Can't update," "Internet not available"; fi;;
		*) virhe "PROJ_UPD:" "$KRN_PROJ_ST_NEW";;
	esac
}

# reads list projects (proj.csv) and jumps to the project folder.
projekti() {
	case $1 in
		-go) KRN_PROJ_FUNCTION="-p"; KRN_PROJ_INPUT=$2;;
		-o) KRN_PROJ_FUNCTION="-o"; KRN_PROJ_INPUT=$2;;
		-p) KRN_PROJ_FUNCTION="-p"; KRN_PROJ_INPUT=$2;;
		-st) KRN_PROJ_FUNCTION="-st"; KRN_PROJ_INPUT=$2;;
		-u) KRN_PROJ_FUNCTION="-u"; KRN_PROJ_INPUT=$2;;
		p) KRN_PROJ_FUNCTION="-p"; KRN_PROJ_INPUT=$2;;
		u) KRN_PROJ_FUNCTION="-u"; KRN_PROJ_INPUT=$2;;
		*) KRN_PROJ_FUNCTION="-p"; KRN_PROJ_INPUT=$1;;
	esac
	KR_DIRPO=$(projekti-dir -d $KRN_PROJ_INPUT)
	if [ -d $KR_DIRPO ]; then
		\cd $KR_DIRPO
		case $KRN_PROJ_FUNCTION in
			-o) open .;;
			-u) if [ -d .git/ ]; then projekti_update; fi;;
			*) if [ -d .git/ ]; then git status --short; else if [ -d ../.git/ ]; then git status --short; else if [ -d ../../.git/ ]; then git status --short; else ls; fi; fi; fi;;
		esac
		compu_proj $KRN_PROJ_FUNCTION $KRN_PROJ_INPUT
	else 
		virhe PROJ $KRN_PROJ_INPUT $KR_DIRPO "is not a directory!"
	fi
}
