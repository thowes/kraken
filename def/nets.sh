#!/bin/bash
if [ $KR_DEBUG == "true" ]; then tynnyri NETS; fi

# When you connect to networks via ethernet cable
case "$VERKKO_IP" in
	*0.0.0.0*) KR_NETWORK="NADA"; VERKKO="NADA";;
	*192.168.109.*) KR_NETWORK="HOME"; VERKKO="HOME";;
	*192.168.1.*) KR_NETWORK="OFFICE"; VERKKO="OFFICE";;
esac

# When you connect to networks via WLAN
case "$VERKKO_SSID" in
	*cafe_ssid*) KR_NETWORK="CAFE"; VERKKO="CAFE";;
	*mobile_ssid*) KR_NETWORK="MOBILE"; VERKKO="MOBILE";;
	*nada*) KR_NETWORK="NADA"; VERKKO="NADA";;
	*home_ssid*) KR_NETWORK="HOME"; VERKKO="HOME";;
	*office_ssid*) KR_NETWORK="WORK"; VERKKO="WORK";;
esac
