#!/bin/bash
#proj.sh, L 26.6.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri new "KRAKEN/PROJ /w"; fi
if [ -f $KR_DIR_LIB/val.sh ]; then . $KR_DIR_LIB/val.sh; fi
#if [ -f $KR_DIR_LIB/ror.sh ]; then . $KR_DIR_LIB/ror.sh; fi
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri kick; fi

# reads list projects (proj.csv) and jumps to the project folder.
projekti_go() {
	KR_DIRPO_TEMP=$(cat ~/$KR_DIR_CFG/proj.csv|grep $1|awk -F, '{ print $4 }')
	KR_DIRPO=$KR_DIRPO_TEMP
	KR_DIRPO_HOME=~
	case $KR_DIRPO_TEMP in
		~*) KR_DIRPO=$KR_DIRPO_HOME$(echo $KR_DIRPO_TEMP|awk -F~ '{ print$2 }');;
	esac
	if [ $KR_DIRPO != '' ]; then
		if [ -d $KR_DIRPO ]; then
			debug PROJ $1 $KR_DIRPO
			cd $KR_DIRPO
			compu_proj $1
			#open .
		else
			virhe PROJ $1 $KR_DIRPO "is not a directory!"
		fi
	else
		virhe PROJ $1 $KR_DIRPO "just error!"
	fi
}

# update (pull) project if in master branch, if working dir is clean and if there are no commits to push.
projekti_update() {
	if [ $VERKKO != "NADA" ]; then
		KR_PROJ_STATUS=$(git status)
		KR_PROJ_BRANCH=$(echo $KR_PROJ_STATUS | grep 'On branch')
		case $KR_PROJ_BRANCH in
			*master*)
				KR_PROJ_UPDATE=$(echo $KR_PROJ_STATUS | grep origin)
				case $KR_PROJ_UPDATE in
					*up-to-date*)
						KR_PROJ_COMMITS=$(echo $KR_PROJ_STATUS | grep commit | grep to)
						case $KR_PROJ_COMMITS in
							*nothing*) git pull;;
							*) virhe You have changes "to commit";;
						esac;;
					*ahead*) virhe You are "ahead of master" "in commits";;
					*) virhe NOT up to date with master;;
				esac;;
			*) virhe You are NOT in master branch;;
		esac
	else virhe Internet not available
	fi 
}
