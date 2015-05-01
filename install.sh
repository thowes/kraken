#!/bin/bash
#install.sh, L 11.6.2013, L 10.7.2013
echo "[[ install for kraken shell script collection ]]"

install_kraken_cfg_settings() {
	kaiku "KRAKEN/COMPU" kirjoita $1
	HAKEMISTO=$KR_DIR_CFG
	if [ -f $HAKEMISTO/default/default.sh ]; then . $HAKEMISTO/default/default.sh; fi
	if [ -f $HAKEMISTO/$1/$1.sh ]; then . $HAKEMISTO/$1/$1.sh
		TIEDOSTO=compu_temp.txt
		touch $TIEDOSTO
		echo "[[ KRAKEN/COMPU kirjoita $1, $TIEDOSTO ]]"
		echo -e "#!/bin/bash\n$1_info() {" > $TIEDOSTO
		echo -e "\techo \"[[ KRAKEN/$1 info, L $KR_COMPU_LPVM, P $KR_COMPU_PPVM ]]\"\n}" >> $TIEDOSTO
		echo -e "if [ \$VERBOSITY == \"true\" ]; then $1_info; fi" >> $TIEDOSTO
		echo -e "\n# GENERAL SETTINGS" >> $TIEDOSTO
		echo -e "EDITOR=$EDITOR" >> $TIEDOSTO
		echo -e "KR_COMPU_HOSTED=$KR_COMPU_HOSTED" >> $TIEDOSTO
		echo -e "KR_COMPU_KER=$KR_COMPU_KER" >> $TIEDOSTO
		echo -e "KR_COMPU_KOP=$KR_COMPU_KOP" >> $TIEDOSTO
		echo -e "KR_COMPU_LPVM=$KR_COMPU_LPVM" >> $TIEDOSTO
		echo -e "KR_COMPU_PPVM=$KR_COMPU_PPVM" >> $TIEDOSTO
		echo -e "KR_COMPU_SRV=$KR_COMPU_SRV" >> $TIEDOSTO
		echo -e "KR_COMPU_SYNK=$KR_COMPU_SYNK" >> $TIEDOSTO
		echo -e "KR_COMPU_USER=$KR_COMPU_USER" >> $TIEDOSTO
		mv $TIEDOSTO $HAKEMISTO/$1/$1.sh
	fi
}

if [ -f 'kraken.sh' ]; then
	FROM_DIR="def"
else
	FROM_DIR="~/proj/kraken/def"
fi

TESTATTR=$1.
if [ $TESTATTR == "." ]; then
	if [ -d 'cfg' ]; then
		echo "[[ ERR INSTALL directory CFG exists already! ]]"
	else
		mkdir cfg
		cp $FROM_DIR/*.sh cfg/
		if [ -f $FROM_DIR/kraken.cfg ]; then cp $FROM_DIR/kraken.cfg cfg/kraken.cfg; fi
		if [ -f $FROM_DIR/proj.csv ]; then cp $FROM_DIR/proj.csv cfg/proj.csv; fi
	fi
else
	if [ -d $1 ]; then
		echo "[[ ERR INSTALL directory CFG exists already! ]]"
	fi
fi

#echo if [ -f $FROM_DIR/kraken.cfg ] then . $FROM_DIR/kraken.sh b $FROM_DIR/kraken.cfg fi