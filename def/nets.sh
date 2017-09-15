#!/bin/bash
#def/nets.sh, L 2.4.2013
if [ $KR_DEBUG == "true" ]; then tynnyri NETS; fi

# When you connect to networks via ethernet cable
case "$VERKKO_IP" in
	*0.0.0.0*) VERKKO="NADA";;
	*192.168.109.*) VERKKO="HOME";;
	*192.168.1.*) VERKKO="OFFICE";;
esac

# When you connect to networks via WLAN
case "$VERKKO_SSID" in
	*cafe_ssid*) VERKKO="CAFE";;
	*mobile_ssid*) VERKKO="MOB";;
	*nada*) VERKKO="NADA";;
	*home_ssid*) VERKKO="HOME";;
	*office_ssid*) VERKKO="WORK";;
esac
