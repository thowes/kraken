#!/bin/bash
#install.sh, L 11.6.2013, L 10.7.2013
echo "[[ install for kraken shell script collection ]]"

if [ -f 'kraken.sh' ]; then
	KR_FROM_DIR=$(pwd)
else
	KR_FROM_DIR="~/proj/kraken"
fi

TESTATTR=$1.
if [ $TESTATTR == "." ]; then
	KR_TO_DIR=$(pwd)/cfg
	if [ -d 'cfg' ]; then
		if [ -f $KR_FROM_DIR/cfg/compu.sh ]; then echo "[[ ERR INSTALL compu.sh exists already in the directory! ]]"; else cp $KR_FROM_DIR/def/compu.sh cfg/compu.sh; fi
		if [ -f $KR_FROM_DIR/cfg/nets.sh ]; then echo "[[ ERR INSTALL nets.sh exists already in the directory! ]]"; else cp $KR_FROM_DIR/def/nets.sh cfg/nets.sh; fi
		if [ -f $KR_FROM_DIR/cfg/kraken.cfg ]; then echo "[[ ERR INSTALL directory CFG exists already in the directory! ]]"; else cp $KR_FROM_DIR/def/kraken.cfg cfg/kraken.cfg; fi
		if [ -f $KR_FROM_DIR/cfg/proj.csv ]; then echo "[[ ERR INSTALL compu.sh exists already in the directory! ]]"; else cp $KR_FROM_DIR/def/proj.csv cfg/proj.csv; fi
	else
		mkdir cfg
		cp $KR_FROM_DIR/def/*.sh cfg/
		if [ -f $KR_FROM_DIR/def/kraken.cfg ]; then cp $KR_FROM_DIR/def/kraken.cfg cfg/kraken.cfg; fi
		if [ -f $KR_FROM_DIR/def/proj.csv ]; then cp $KR_FROM_DIR/def/proj.csv cfg/proj.csv; fi
	fi
else
	KR_TO_DIR=$1
	if [ -d $1 ]; then
		echo "[[ ERR INSTALL directory CFG exists already! ]]"
	fi
fi

echo -e "\nif [ -f $KR_TO_DIR/kraken.cfg ]; then . $KR_FROM_DIR/kraken.sh b '$KR_TO_DIR/kraken.cfg'; fi" >> ~/.bashrc