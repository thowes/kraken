#!/bin/bash
if [ $KR_DEBUG == "true" ]; then tynnyri KERAIN; fi

cd
tynnyri new KERAIN
if [ -f ~/public_html/index.html ]; then cp ~/public_html/index.html $KR_DIR_CFG/server/index.html; fi
tynnyri kick $1
