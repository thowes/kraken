#!/bin/bash
if [ -f ~/Projects/kraken/lib/bash_aliases.sh ]; then
    . ~/Projects/kraken/lib/bash_aliases.sh
else echo NOT FOUND bash_aliases.sh; fi

alias a='git add -A; git commit -m'
alias b=bundle
alias g=git
alias h=heroku
alias ipf=ifconfig
alias k=kill
alias l='ls -oA'
alias n=nano
alias p=projekti_go
alias q='quota -v'
alias r=rails
alias t=touch
alias tl='ps aux'
alias x=exit
