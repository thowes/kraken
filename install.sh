#!/bin/bash
#install.sh, L 11.6.2013, L 10.7.2013
echo "[[ install for kraken shell script collection ]]"

install_create_cfg_dir() {
	if [ -d $1 ]; then
		echo "[[ " $1 " is a directory ]]"
		KR_DIR_CFG=$1
		install_create_files
		install_kraken_cfg
	else
		if [ -f $1 ]; then 
			echo "[[ " $1 " is a file ]]"
			exit
		else 
			echo "[[ Creating " $1 " directory ]]"
			mkdir $1
			KR_DIR_CFG=$1
			install_create_files
			install_kraken_cfg
		fi	
	fi
}

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

if [ $1 == '' ]; then
	virhe INSTALL "no CFG directory defined"
	if [ -f 'kraken.sh' ]; then
		if [ -d 'cfg' ]; then
			virhe INSTALL "directory CFG exists already!"
		else
			mkdir cfg
			cp def/*.sh cfg/
			if [ -f def/kraken.cfg ]; then cp cfg/kraken.cfg; fi
			if [ -f def/proj.csv ]; then cp cfg/proj.csv; fi
		fi
	else
		virhe INSTALL "not in kraken directory."
	fi
else
	if [ -d $1 ]; then
		virhe 
fi