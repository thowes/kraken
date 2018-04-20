#!/bin/bash
compu_app() {
	debug COMPU app $1 $KR_NETWORK
}

compu_proj() {
	debug COMPU proj $1 $KR_NETWORK
	#This is the default behaviour when accessing project dir with projekti_go command.
	if [ -d .git ]; then
		git status --short
		if [ "" == "-u" ]; then compu_secu; fi
	else
		if [ -d ../.git ]; then
			git status --short
		else
			ls
		fi
	fi
}

compu_secu() {
	debug COMPU secu $1 $2
}

compu_start() {
	debug COMPU start $1 $KR_NETWORK
	#if [ -f $KR_DIR_CFG/kerain.sh ]; then . $KR_DIR_CFG/kerain.sh; fi
	#if [ -f $KR_DIR_CFG/vker.sh ]; then . $KR_DIR_CFG/vker.sh; fi
}

compu_tasks() {
	debug COMPU tasks $1 $KR_NETWORK
}

#Output of this command is part of PS1 prompt. 
#In my own version the value of $KR_NETWORK instead of thevalue of tty.
compu_terminal() {
	echo $(tty|grep dev|awk -F/ '{ print $2 }')
}
