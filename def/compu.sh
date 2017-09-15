#!/bin/bash
#def/compu.sh, L 31.3.2013

compu_app() {
	debug COMPU app $1 $VERKKO
}

compu_proj() {
	debug COMPU proj $1 $VERKKO
	#This is the default behaviour when accessing project dir with projekti_go command.
	#In my own version I also call projekti_update if in the project main dir.
	if [ -d .git ]; then git status --short; else if [ -d ../.git ]; then git status --short; else ls; fi; fi
}

compu_start() {
	debug COMPU start $1 $VERKKO
	#if [ -f ~/$KR_DIR_CFG/kerain.sh ]; then . ~/$KR_DIR_CFG/kerain.sh; fi
	#if [ -f ~/$KR_DIR_CFG/vker.sh ]; then . ~/$KR_DIR_CFG/vker.sh; fi
}

compu_tasks() {
	debug COMPU tasks $1 $VERKKO
}

#Output of this command is part of PS1 prompt. 
#In my own version the value of $VERKKO instead of value tty.
compu_terminal() {
	echo $(tty|grep dev|awk -F/ '{ print $2 }')
}
