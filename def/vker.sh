#!/bin/bash
#vker.sh, L 24.5.2007/8.7.2015
if [ $KR_DEBUG == "true" ]; then tynnyri VKER; fi

cd
tynnyri new VKER

#bg
#varko /system/backgrounds bg;;

#logs
#varko ~/rails/my_app/logs my_appLogs

tynnyri kick
