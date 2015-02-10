#!/bin/bash
#uus.sh, L 11.6.2013/11.11.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri "UUS"; fi

uus() {
	case "$1" in
		subl) cp $KR_DIR_LIB/../tmpl/subl.sublime-project subl.sublime-project;;
		mf) cp $KR_DIR_LIB/../tmpl/$2.makefile makefile;;
		*) cp ~/$KR_DIR_TMPL/$1 $2;;
	esac
}
