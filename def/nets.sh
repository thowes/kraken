#!/bin/bash
#def/nets.sh, L 2.4.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri NETS; fi

case "$VERKKO_IP" in
	*192.197.0.1*) VERKKO="HOME";;
	*192.197.109.1*) VERKKO="WORK";;
esac

case "$VERKKO_SSID" in
        *cafe_ssid*) VERKKO="CAFE";;
        *mobile_ssid*) VERKKO="MOB";;
        *home_ssid*) VERKKO="HOME";;
        *office_ssid*) VERKKO="WORK";;
esac
