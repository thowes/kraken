#!/bin/bash
valitse() {
DIR_CFG=$(asetus dir:cfg)
#prints to screen list projects valid for current location
cat $DIR_CFG/proj.csv|\grep $1|awk -F, '{ print " "$1"\t" $2 }'
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
KR_DIRPO_LINE=$(cat $DIR_CFG/proj.csv|\grep $PROJECT)
KR_DIRPO=$(echo $KR_DIRPO_LINE|awk -F, '{print $4}')
echo PROJECT=$PROJECT \n KR_DIRPO_LINE=$KR_DIRPO_LINE \n KR_DIRPO=$KR_DIRPO > $(asetus dir:temp)/$(verkko tty).proj
}
