#!/bin/bash
#svn.sh from kir_proj.sh, L 23.1.2014
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri SVN; fi

svn_projekti() {
	kaiku SVN $1 $2 $3
	if [ "$1" != "" ] && [ -d ~/$KR_DIR_PROJ/$1 ]; then
		cd ~/$KR_DIR_PROJ/$1
		case $2 in
			co) echo svn co svn+ssh://$KR_DIR_REPOS/$1 $1;;
			go) cd $3; svn status;;
			info) svn info;;
			rev) svn info|grep Revision;;
			revision) svn info|grep Revision;;
			st) svn status;;
			status) svn status;;
			tila) svn status;;
			up) if [ $VERKKO != "NADA" ]; then svn update; fi;;
			upd) if [ $VERKKO != "NADA" ]; then svn update; fi;;
			update) if [ $VERKKO != "NADA" ]; then svn update; fi;;
			*) svn status;;
		esac
	fi

}
