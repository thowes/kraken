#!/bin/bash
#uus.sh, L 11.6.2013/11.11.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri "UUS"; fi

uus() {
	case "$1" in
		dir) cp $KR_DIR_LIB/../tmpl/dir.makefile makefile;;
		git) cp $KR_DIR_LIB/../tmpl/git.makefile makefile;;
		mf) cp $KR_DIR_LIB/../tmpl/$2.makefile makefile;;
		subl) cp $KR_DIR_LIB/../tmpl/subl.sublime-project subl.sublime-project;;
		svn) cp $KR_DIR_LIB/../tmpl/svn.makefile makefile;;
		sh) cp $KR_DIR_LIB/../tmpl/template.sh template.sh;;
		*) cp ~/$KR_DIR_TMPL/$1 $2;;
	esac
}
