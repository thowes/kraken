#!/bin/bash
#def/kerain.sh, L 24.5.2007
if [ $KR_DEBUG == "true" ]; then tynnyri KERAIN; fi

kerain() {
  kaiku $1
  cd
  case $1 in
	web)
		cp ~/public_html/index.html ~/$KR_DIR_CFG/index.html
		;;
	*)
		if [ $HOSTNAME == "hostname" ]; then
			tynnyri new KERAIN
			kerain web
			tynnyri kick $1
		fi;;
  esac
}
