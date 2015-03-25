#!/bin/bash
#def/compu.sh, L 31.3.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri new "DEF/COMPU /w"; fi
#if [ -f ~/$KR_DIR_HOST/dirs.sh ]; then . ~/$KR_DIR_HOST/dirs.sh; fi
if [ -f ~/$KR_DIR_HOST/kerain.sh ]; then . ~/$KR_DIR_HOST/kerain.sh; fi
if [ -f ~/$KR_DIR_HOST/palv.sh ]; then . ~/$KR_DIR_HOST/palv.sh; fi
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri kick; fi

compu_proj() {
	make st
}

compu_start() {
	debug COMPU start $1 $VERKKO
}

compu_tasks() {
	debug COMPU tasks $1 $VERKKO
}

compu_terminal() {
	debug COMPU terminal $1 $VERKKO
}
