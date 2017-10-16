#!/bin/bash
if [ -f ~/Projects/kraken/lib/bash_aliases.sh ]; then
    . ~/Projects/kraken/lib/bash_aliases.sh
else echo ALIAS FILE NOT FOUND; fi

alias a='git add -A; git commit -m'
alias asenna='sudo apt-get install'
alias b=bundle
alias buut='sudo shutdown -r now'
alias g=git
alias h=heroku
alias here='open .'
alias ipf=ifconfig
alias k=kill
alias l='ls -o'
alias n=nano
alias op=open
alias p=projekti_go
alias r=rails
alias rev='make rev'
alias rt='cd /'
alias sammu='sudo shutdown -h now'
alias t=touch
alias v=verkko
alias x=exit
alias X='startx'
alias y='synkronoi ssh'