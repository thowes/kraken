#!/bin/bash
#val.sh, L 11.6.2013/20.7.2014
if [ $KR_DEBUG == "true" ]; then tynnyri VAL; fi

valitse() {
	#prints to screen list projects valid for current location
	cat $KR_DIR_CFG/proj.csv|grep $1|awk -F, '{ print " "$1"\t" $2 }'
	KR_PROJ_TEMP="def"
	KR_PROJ_TEST=" "
	read -p "PROJECT " -r KR_PROJ_TEMP
	KR_PROJ_TEST=$(echo $KR_PROJ_TEMP)
	if [[ -n "${KR_PROJ_TEST/[ ]*\n/}" ]]; then
		#execute if the the variable is not empty and contains non space characters
		PROJECT=$KR_PROJ_TEMP
		debug PROJ is $KR_PROJ_TEMP "." 
	else
    	#execute if the variable is empty or contains only spaces
		PROJECT="def"
		debug PROJ $KR_PROJ_TEST is "empty." 
	fi
	KR_DIRPO_LINE=$(cat $KR_DIR_CFG/proj.csv | grep $PROJECT )
}
