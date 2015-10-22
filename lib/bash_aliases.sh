alias bu='ror_bundle'
alias bx='bundle exec'
alias cd..='cd ..'
alias cd2='cd ..;cd ..'
alias cd3='cd ..;cd ..;cd ..'
alias cim='svn commit -m'
alias ed=muokkaa
alias gm='git add .; git commit -m'
alias go='projekti_go'
alias hst='cat ~/.bash_history'
alias k9='kill -9'
alias levy='df -h'
alias ll='ls -la|less'
alias mk=make
alias more=less
alias n2='nano -w -T 2'
alias op=projekti_avaa
alias proj=projekti
alias psf='ps fu'
alias pull='git pull'
alias push='git push'
alias remote='git remote'
alias rev='make rev'
alias rr=rails
alias rs=rspec
alias ru=screen
alias sad='svn add'
alias st='if [ -f makefile ]; then make st; else svn st; fi'
alias tst='ror_tst'
alias up='make upd'
alias upd='make upd'
alias update='make upd'
alias xx='rm ~/.bash_history; touch ~/.bash_history; exit'

if [ -f ~/proj/config/$HOSTNAME/alias.sh ]; then
    . ~/proj/config/$HOSTNAME/alias.sh
fi
