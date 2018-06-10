#!/bin/bash
if [ $KR_DEBUG == "true" ]; then tynnyri new "KRAKEN/PROJ /w"; fi
if [ -f $KR_DIR_LIB/val.sh ]; then . $KR_DIR_LIB/val.sh; fi
if [ $KR_DEBUG == "true" ]; then tynnyri kick; fi

# reads list projects (proj.csv) and jumps to the project folder.
projekti() {
	case $1 in
		-o) KRN_PROJ_FUNCTION="-o"; KRN_PROJ_INPUT=$2;;
		-p) KRN_PROJ_FUNCTION="-p"; KRN_PROJ_INPUT=$2;;
		-st) KRN_PROJ_FUNCTION="-st"; KRN_PROJ_INPUT=$2;;
		-u) KRN_PROJ_FUNCTION="-u"; KRN_PROJ_INPUT=$2;;
		p) KRN_PROJ_FUNCTION="-p"; KRN_PROJ_INPUT=$2;;
		u) KRN_PROJ_FUNCTION="-u"; KRN_PROJ_INPUT=$2;;
		*) KRN_PROJ_FUNCTION="-p"; KRN_PROJ_INPUT=$1;;
	esac
	KR_PROJECTS_COUNT=$(cat $KR_DIR_CFG/proj.csv | \grep $KRN_PROJ_INPUT | wc -l | awk '{ print $1 }')
	case $KR_PROJECTS_COUNT in
		0) virhe "Project keyword" $KRN_PROJ_INPUT "not found" "in project file.";;
		1)
			KR_DIRPO_LINE=$(cat $KR_DIR_CFG/proj.csv | \grep $KRN_PROJ_INPUT )
			KR_DIRPO=$(echo $KR_DIRPO_LINE | awk -F, '{ print $4 }')
			KR_DIRPO_TEMP=$KR_DIRPO; KR_DIRPO_HOME=~
			case $KR_DIRPO_TEMP in
				~*) KR_DIRPO=$KR_DIRPO_HOME$(echo $KR_DIRPO_TEMP | awk -F~ '{ print$2 }');;
			esac
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
			fi;;
		*) virhe "Project keyword" $KRN_PROJ_INPUT "found multiple times in project file.";;
	esac
}

projekti_status() {
	KR_PROJ_STATUS=$(git status)
	KR_PROJ_BRANCH=$(echo $KR_PROJ_STATUS | \grep 'On branch')
	case $KR_PROJ_BRANCH in
		*master*)
			KR_PROJ_UPDATE=$(echo $KR_PROJ_STATUS | \grep origin)
			case $KR_PROJ_UPDATE in
				*ahead*) echo "You are ahead of master branch in commits.";;
				*date*)
					KR_PROJ_COMMITS=$(echo $KR_PROJ_STATUS | \grep commit | \grep to)
					case $KR_PROJ_COMMITS in
						*nothing*) echo "Up-to-date with origin/master";;
						*) echo "You have changes not staged for commit.";;
					esac;;
			esac;;
		*) echo "Not in master branch";;
	esac
}

# this function is a tool for keeping projects automatically updated if they use git.
# update (pull) project if in master branch, if working dir is clean and if there are no commits to push.
projekti_update() {
	KR_PROJ_STATUS=$(git status)
	KR_PROJ_BRANCH=$(echo $KR_PROJ_STATUS | \grep 'On branch')
	case $KR_PROJ_BRANCH in
		*master*)
			KR_PROJ_UPDATE=$(echo $KR_PROJ_STATUS | \grep origin)
			case $KR_PROJ_UPDATE in
				*date*)
					KR_PROJ_COMMITS=$(echo $KR_PROJ_STATUS | \grep commit | \grep to)
					case $KR_PROJ_COMMITS in
						*nothing*) if [ $KR_NETWORK != "NADA" ]; then git pull; else virhe "Can't update," "Internet not available"; fi;;
						*) virhe "Can't" "update," "you have changes" "to commit";;
					esac;;
				*ahead*) virhe "Can't update," "you are" "ahead of master" "in commits";;
				*) virhe NOT "up to date" with master;;
			esac;;
		*) virhe "Can't update," "you are" NOT "in master branch";;
	esac
}
