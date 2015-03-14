#!/bin/bash
#install.sh, L 11.6.2013, L 10.7.2013
if [ $VERBOSITY -ge $LEV_V ]; then kaiku "KRAKEN/DIRSW"; fi
echo "[[ install for kraken shell script collection ]]"
#KR_DIR_CFG=$1

install_create_files() {
	if [ -f ~/$KR_DIR_CFG/alias.sh ]; then exit; else cp $KR_DIR_LIB/def/alias.sh ~/$KR_DIR_CFG/alias.sh; fi
	if [ -f ~/$KR_DIR_CFG/compu.sh ]; then exit; else cp $KR_DIR_LIB/def/compu.sh ~/$KR_DIR_CFG/compu.sh; fi
	if [ -f ~/$KR_DIR_CFG/kerain.sh ]; then exit; else cp $KR_DIR_LIB/def/kerain.sh ~/$KR_DIR_CFG/kerain.sh; fi
	if [ -f ~/$KR_DIR_CFG/nets.sh ]; then exit; else cp $KR_DIR_LIB/def/nets.sh ~/$KR_DIR_CFG/nets.sh; fi
	if [ -f ~/$KR_DIR_CFG/palv.sh ]; then exit; else cp $KR_DIR_LIB/def/palv.sh ~/$KR_DIR_CFG/palv.sh; fi
}

install_create_cfg_dir() {
	if [ -d $1 ]; then
		KR_DIR_CFG=$1
		install_create_files
	else
		echo $1 not a directory
		if [ -f $1 ]; then 
			exit
		else 
			mkdir $1
			KR_DIR_CFG=$1
			install_create_files
		fi	
	fi
}

dirsw_settings() {
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
