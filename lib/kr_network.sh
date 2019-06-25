#!/bin/bash
verkko_update() {
	if [ $KR_WIRELESS == "true" ]; then VERKKO_ESSID=$(verkko ssid); else VERKKO_ESSID=nada; fi
	if [ -f $KR_DIR_CFG/nets.sh ]; then . $KR_DIR_CFG/nets.sh; else virhe FILE nets.sh not found; fi
}

if [ $(asetus bool:hosted) != "true" ]; then
	VERKKO_IP=$(verkko ip)
	verkko_update
fi
