#!/bin/bash
#def/palv.sh, L 26.6.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri PALV; fi

palv() {
	tynnyri $1
	case $1 in
		apache) apache2;;
		mysql) mysql;;
	esac
}
