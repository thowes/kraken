#!/bin/bash
#passu.sh, L 25.3.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri PASSU; fi

passu() {
	read -p "PAUSE, PRESS ENTER " -r KR_PASSU
}