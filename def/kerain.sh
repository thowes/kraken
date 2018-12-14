#!/bin/bash
if [ $KR_DEBUG == "true" ]; then tynnyri KERAIN; fi

if [ -f ~/.bash_logout ]; then cp ~/.bash_logout $KR_DIR_CFG/bash/.bash_logout; fi
if [ -f ~/.bash_profile ]; then cp ~/.bash_profile $KR_DIR_CFG/bash/.bash_profile; fi
if [ -f ~/.bashrc ]; then cp ~/.bashrc $KR_DIR_CFG/bash/.bashrc; fi
if [ -f ~/.profile ]; then cp ~/.profile $KR_DIR_CFG/bash/.profile; fi
if [ -f ~/.rvmrc ]; then cp ~/.rvmrc $KR_DIR_CFG/bash/.rvmrc; fi
if [ -f ~/public_html/index.html ]; then cp ~/public_html/index.html $KR_DIR_CFG/server/index.html; fi
