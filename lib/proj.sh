#!/bin/bash
#proj.sh, L 26.6.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri new "KRAKEN/PROJ /w"; fi
if [ -f $KR_DIR_LIB/val.sh ]; then . $KR_DIR_LIB/val.sh; fi
if [ -f $KR_DIR_LIB/svn.sh ]; then . $KR_DIR_LIB/svn.sh; fi
if [ -f $KR_DIR_LIB/git.sh ]; then . $KR_DIR_LIB/git.sh; fi
if [ -f $KR_DIR_LIB/ror.sh ]; then . $KR_DIR_LIB/ror.sh; fi
if [ -f $KR_DIR_LIB/vs.sh ]; then . $KR_DIR_LIB/vs.sh; fi
#if [ -f ~/$KR_DIR_LIB/vir.sh ]; then . ~/$KR_DIR_LIB/vir.sh; fi
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri kick; fi

# Eventually this is going to replace projekti(), but it has some quirks still.
projekti_go() {
	KR_DIRPO=$(cat ~/$KR_DIR_HOST/proj.csv|grep $1|awk -F, '{ print $4 }')
	if [ $KR_DIRPO != "" ]; then 
		if [ -d $KR_DIRPO ]; then
			kaiku PROJ $1 $KR_DIRPO
			cd $KR_DIRPO
			#jaax clr
			#jaax st win7
			#jaax ql $VERKKO $1
			#jaax fl $VERKKO $1
			compu_proj $1
		else
			virhe PROJ $1 $KR_DIRPO "not a directory!"
		fi
	else
		virhe PROJ $1 $KR_DIRPO "just error!"
	fi
}
