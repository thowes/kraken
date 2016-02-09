alias bu=bundle
alias bx='bundle exec'
alias cd..='cd ..'
alias cd2='cd ..;cd ..'
alias cd3='cd ..;cd ..;cd ..'
alias cim='svn commit -m'
alias ed=muokkaa
alias gm='git add .; git commit -m'
alias go='projekti_go'
alias hst='cat ~/.bash_history'
alias k=kill
alias k9='kill -9'
alias levy='df -h'
alias l='ls -la'
alias ll='ls -la|less'
alias m=less
alias merge='git merge'
alias migrate='rake db:migrate'
alias mk=make
alias more=less
alias n=nano
alias n2='nano -w -T 2'
alias p=projekti
alias proj=projekti
alias psf='ps fu'
alias pull='git pull'
alias push='git push'
alias r=rails
alias remote='git remote'
alias rev='make rev'
alias rk=rake
alias rollback='rake db:rollback'
alias rs=rspec
alias ru=screen
alias sad='svn add'
alias st='if [ -f makefile ]; then make st; else svn st; fi'
alias up='make upd'
alias upd='make upd'
alias update='make upd'
alias x=exit
alias xx='rm ~/.bash_history; touch ~/.bash_history; exit'

if [ -f ~/proj/config/$HOSTNAME/alias.sh ]; then
    . ~/proj/config/$HOSTNAME/alias.sh
fi
