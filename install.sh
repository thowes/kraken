#!/bin/bash
#install.sh, L 10.7.2013
echo "[[ install for kraken shell script collection ]]"
if [ -d $1 ]; then
	KR_DIR_CFG=$1
else
	echo $1 not a directory
fi
