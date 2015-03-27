#!/bin/bash
#install.sh, L 11.6.2013, L 10.7.2013
echo "[[ install for kraken shell script collection ]]"

install_create_files() {
	if [ -f ~/$KR_DIR_CFG/alias.sh ]; then echo "[[ file exists ]]"; else cp def/alias.sh ~/$KR_DIR_CFG/alias.sh; fi
	if [ -f ~/$KR_DIR_CFG/compu.sh ]; then echo "[[ file exists ]]"; else cp def/compu.sh ~/$KR_DIR_CFG/compu.sh; fi
	if [ -f ~/$KR_DIR_CFG/kerain.sh ]; then echo "[[ file exists ]]"; else cp def/kerain.sh ~/$KR_DIR_CFG/kerain.sh; fi
	if [ -f ~/$KR_DIR_CFG/nets.sh ]; then echo "[[ file exists ]]"; else cp def/nets.sh ~/$KR_DIR_CFG/nets.sh; fi
}

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
