#!/bin/bash

# reads list projects (proj.csv) and jumps to the project folder.
projekti-func() {
	case $1 in
		-go|-p|p) KRN_PROJ_FUNCTION="-p"; KRN_PROJ_INPUT=$2;;
		-o) KRN_PROJ_FUNCTION="-o"; KRN_PROJ_INPUT=$2;;
		-st) KRN_PROJ_FUNCTION="-st"; KRN_PROJ_INPUT=$2;;
		-u) KRN_PROJ_FUNCTION="-u"; KRN_PROJ_INPUT=$2;;
		*) KRN_PROJ_FUNCTION="-p"; KRN_PROJ_INPUT=$1;;
	esac
	KR_DIRPO=$(projekti-new dir $KRN_PROJ_INPUT)
	if [ -d $KR_DIRPO ]; then
		\cd $KR_DIRPO
		case $KRN_PROJ_FUNCTION in
			-o) open .;;
			-u) if [ -d .git/ ]; then projekti-update; fi;;
			*)
				if [ -d .git/ ]; then
					git status --short
				else 
					if [ -d ../.git/ ]; then
						git status --short
					else
						if [ -d ../../.git/ ]; then
							git status --short
						else
							case $(uname) in
								Darwin*) gls;;
								*) ls;;
							esac
						fi
					fi
				fi;;
		esac
		compu_proj $KRN_PROJ_FUNCTION $KRN_PROJ_INPUT
	else 
		virhe PROJ $KRN_PROJ_INPUT $KR_DIRPO "is not a directory!"
	fi
}
