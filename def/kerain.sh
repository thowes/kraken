#!/bin/bash
#def/kerain.sh, L 24.5.2007
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri KERAIN; fi

kerain() {
  kaiku $1
  cd
  case $1 in
	web)
		cp ~/public_html/index.html ~/$KR_DIR_CFG/index.html
		;;
	*)
		if [ $HOSTNAME == "hostname" ]; then
			kaiku new KERAIN
			kerain web
			kaiku dump $1
		fi;;
  esac
}
