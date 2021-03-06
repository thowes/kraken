#!/bin/bash
echo "[[ install for kraken shell script collection ]]"

if [ -f 'kraken.sh' ]; then
	KR_FROM_DIR=$(pwd)
else
	KR_FROM_DIR="~/Projects/kraken"
fi

KR_SYSTEM_TYPE=$(uname -a)
KR_INSTALL_ALIAS_FILE="alias_hosted.sh"
case $KR_SYSTEM_TYPE in
	CYGWIN*) KR_INSTALL_ALIAS_FILE="alias_cygwin.sh";;
	Darwin*) KR_INSTALL_ALIAS_FILE="alias_darwin.sh";;
	Linux*) KR_INSTALL_ALIAS_FILE="alias_linux.sh";;
	Ubuntu*) KR_INSTALL_ALIAS_FILE="alias_linux.sh";;
esac

TESTATTR=_$1_
KR_TO_DIR=~/Projects/config
if [ $TESTATTR == "__" ]; then
	if [ -d ~/Projects/ ]; then
		\cd ~/Projects/
		if [ -d 'config' ]; then echo config/ already exists.; else mkdir config; fi
		if [ -d 'temp' ]; then echo temp/ already exists.; else mkdir temp; fi
	fi
else KR_TO_DIR=$1; fi

if [ -f $KR_TO_DIR/alias.sh ]; then echo "[[ ERR INSTALL alias.sh exists already in the directory! ]]"; else cp $KR_FROM_DIR/def/$KR_INSTALL_ALIAS_FILE $KR_TO_DIR/alias.sh; fi
if [ -f $KR_TO_DIR/compu.sh ]; then echo "[[ ERR INSTALL compu.sh exists already in the directory! ]]"; else cp $KR_FROM_DIR/def/compu.sh $KR_TO_DIR/compu.sh; fi
if [ -f $KR_TO_DIR/nets.sh ]; then echo "[[ ERR INSTALL nets.sh exists already in the directory! ]]"; else cp $KR_FROM_DIR/def/nets.sh $KR_TO_DIR/nets.sh; fi
if [ -f $KR_TO_DIR/vker.sh ]; then echo "[[ ERR INSTALL vker.sh exists already in the directory! ]]"; else cp $KR_FROM_DIR/def/vker.sh $KR_TO_DIR/vker.sh; fi
if [ -f $KR_TO_DIR/kraken.cfg ]; then echo "[[ ERR INSTALL kraken.cfg exists already in the directory! ]]"; else cp $KR_FROM_DIR/def/kraken.cfg $KR_TO_DIR/kraken.cfg; fi
if [ -f $KR_TO_DIR/proj.csv ]; then echo "[[ ERR INSTALL compu.sh exists already in the directory! ]]"; else cp $KR_FROM_DIR/def/proj.csv $KR_TO_DIR/proj.csv; fi

KR_INSTALL_OUTPUT_FILE=~/.bashrc
if [ -f $KR_INSTALL_OUTPUT_FILE ]; then
	echo 'KR_TERMINAL="NADA"' >> $KR_INSTALL_OUTPUT_FILE
	echo '#export PS1="\n\t \u@\h via \$KR_TERMINAL: \w\n$ "' >> $KR_INSTALL_OUTPUT_FILE
	echo 'KR_TERMINAL=$(verkko symbol)' >> $KR_INSTALL_OUTPUT_FILE
	echo -e "\nKR_DIR_ALIAS=$KR_TO_DIR" >> $KR_INSTALL_OUTPUT_FILE
	echo -e "if [ -f \$KR_DIR_ALIAS/alias.sh ]; then" >> $KR_INSTALL_OUTPUT_FILE
	echo -e "\t. \$KR_DIR_ALIAS/alias.sh\nfi" >> $KR_INSTALL_OUTPUT_FILE
	echo -e "\nif [ -f \$KR_DIR_ALIAS/kraken.cfg ]; then" >> $KR_INSTALL_OUTPUT_FILE
	echo -e "\t. $KR_FROM_DIR/kraken.sh b \$KR_DIR_ALIAS/kraken.cfg\nfi" >> $KR_INSTALL_OUTPUT_FILE
else echo "Can't output to $KR_INSTALL_OUTPUT_FILE"
fi
