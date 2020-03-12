#!/bin/bash
valitse() {
CFG=$(asetus dir:cfg)
#prints to screen list projects valid for current location
cat $CFG/proj.csv|\grep $1|awk -F, '{ print " "$1"\t" $2 }'
TEMP="def"
KR_PROJ_TEST=" "
read -p "PROJECT " -r TEMP
KR_PROJ_TEST=$(echo $TEMP)
if [[ -n "${KR_PROJ_TEST/[ ]*\n/}" ]]; then
		#execute if the the variable is not empty and contains non space characters
		PROJECT=$TEMP
		debug PROJ is $TEMP "." 
else
		#execute if the variable is empty or contains only spaces
		PROJECT="def"
		debug PROJ $KR_PROJ_TEST is "empty." 
fi
LINE=$(cat $CFG/proj.csv|\grep $PROJECT)
KR_DIRPO=$(echo $LINE|awk -F, '{print $4}')
printf "PROJECT=$PROJECT \nLINE=$LINE \nKR_DIRPO=$KR_DIRPO" > $(asetus dir:temp)/$(verkko tty).proj
}
