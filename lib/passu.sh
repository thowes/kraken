#!/bin/bash
#passu.sh, L 7.5.2008/25.3.2013/24.8.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri PASSU; fi

passu() {
	read -p "PAUSE, PRESS ENTER " -r KR_PASSU
}

salis() {
	read -p "PRESS ENTER " -r KR_SALIS
}