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
PROJECT="def"

projekti() {
	if [ "$1" == "" ]; then
		cd ~/$KR_DIR_PROJ; ls
	else
		if [ "$1" != "" ] && [ -d ~/$KR_DIR_PROJ/$1 ]; then
			cd ~/$KR_DIR_PROJ/$1
			case $2 in
				info) make info;;
				mf) nano makefile;;
				orig) make orig;;
				origin) make orig;;
				pull) make pull;;
				push) make push;;
				rev) make rev;;
				st) make st;;
				status) make st;;
				tila) make st;;
				tls) make tls;;
				todo) make tls;;
				up) make upd;;
				upd) make upd;;
				update) make upd;;
				*) kaiku PROJ status $1; make st; kaiku PROJ todo $1; make tls;;
			esac
		else 
			if [ "$1" != "" ] && [ "$2" != "" ]; then
				projekti $2 $1 $3
			fi
		fi
	fi
}