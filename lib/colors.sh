#!/bin/bash
#colors.sh, 11.2.2014
if [ $KR_DEBUG == "true" ]; then echo "[[ KRAKEN/COLORS ]]"; fi

if [ "true" == "true" ]; then
	BLACK=30m
	BLUE=34m
	LBLUE=94m
	CYAN=36m
	LCYAN=96m
	GREY=grey
	DGREY=90m
	LGREY=37m
	GREEN=32m
	LGREEN=92m
	LIME=lime
	MAGENTA=35m
	LMAGENTA=95m
	ORANGE=orange
	PINK=pink
	PURPLE=purple
	RED=31m
	LRED=91m
	WHITE=97m
	YELLOW=33m
	LYELLOW=93m
	ZERO=e[0m
fi

colors_test() {
	tynnyri new CLRS
	tyn $BLACK
	tyn $BLUE
	tyn $BURGUNDY
	tyn $CELESTE
	tyn $CYAN
	tyn $GREEN
	tyn $GREY; tyn $DARKGREY; tyn $LIGHTGREY
	tyn $IVORY
	tyn $LIME
	tyn $MAGENTA
	tyn $NAVY
	tyn $ORANGE
	tyn $PINK
	tyn $PURPLE
	kaiku $RED RED
	tyn $WHITE
	tyn $YELLOW
	tynnyri kick
}
