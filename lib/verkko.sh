#!/bin/bash
#verkko.sh, L 2.4.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri new "KRAKEN/VERKKO /w"; fi

if [ -f ~/$KR_DIR_HOST/nets.sh ]; then
	VERKKO_DNS="NADA"
	VERKKO_IP="NADA"
	VERKKO_ESSID="NADA"
	VERKKO_MAC="NADA"
	case $KAYTTIS in
		cygwin)
			VERKKO_IP=$(ipconfig|grep IPv4)
			if [ $LANGATON == "true" ]; then VERKKO_ESSID=$(netsh wlan show interfaces|grep SSID); else VERKKO_ESSID=nada; fi
			#VERKKO_MAC=$(arp -a|grep dynamic)
			;;
		ubuntu)
			VERKKO_IP=$(ifconfig eth0|grep Bcast)
			if [ $LANGATON == "true" ]; then VERKKO_ESSID=$(iwlist wlan0 scan|grep ESSID); else VERKKO_ESSID=nada; fi
			#VERKKO_MAC=$(arp -a|grep dynamic)
			;;
		*) echo "[[ KRAKEN/VERKKO err1: $KAYTTIS ei tunnistettu/tuettu! ]]";;
	esac
	source ~/$KR_DIR_HOST/nets.sh
fi
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri $VERKKO; tynnyri kick; fi

verkko() {
	case $KAYTTIS in
		cygwin)
			case $1 in
				ap) netsh wlan show networks;;
				arp) arp -a;;
				dns) ipconfig|grep "DNS Suffix Search List";;
				eth) netsh lan show interfaces;;
				ip) ipconfig|grep IPv4;;
				lan) netsh lan show interfaces;;
				mac) getmac /v;;
				ssid) netsh wlan show interfaces|grep SSID;;
				wlan) netsh wlan show interfaces;;
				*) ipconfig /all;;
       esac;;
		ubuntu)
			case $1 in
				ap) iwlist wlan0 scan|grep ESSID;;
				arp) arp -a;;
				eth) ifconfig eth0;;
				ip) ifconfig -a|grep IP;;
				lan) ifconfig eth0;;
				mac) ifconfig -a|grep HWaddr;;
				wlan) ifconfig wlan0;;
				*) ifconfig -a;;
			esac
			;;
		*) echo "[[ KRAKEN/VERKKO err2: $KAYTTIS ei tunnistettu/tuettu! ]]";;
	esac
}
