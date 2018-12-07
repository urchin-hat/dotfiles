# Git(install homebrew)
source /usr/local/etc/bash_completion.d/git-prompt.sh > /dev/null
source /usr/local/etc/bash_completion.d/git-completion.bash > /dev/null
GIT_PS1_SHOWDIRTYSTATE=true
PS1='[\u@\W$(__git_ps1 "(\033[32m\]%s\[\033[0m\])")\]]$ '
# PS1="[\u@\W]\$ "

# bash_history
HISTSIZE=1000
export HISTIGNORE="fg*:bg*:history*:cd*:hs*"

# config
export EDITOR="emacs"

# alias
## bash alias
alias sbp='source ~/.bash_profile'
alias emacs='/usr/local/bin/emacs -nw'
alias e='emacs'
alias em='emacs'
alias emcas='emacs'
alias gb='git branch'
alias gc='git checkout'
alias ls='ls -G'
alias la='ls -oa'
alias ll='ls -olh'
alias cl='clear'
alias grep='grep --color'
alias fgrep='fgrep --color'
alias df='df -h'
alias loghttpd='cd /var/log/httpd/$(date +%Y)/$(date +%m)/$(date +%d)/'
alias vi='vim'
alias his='history'
alias hs='history | fgrep $1'

## Python's alias
alias pip_all='pip freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs pip install -U'
alias py='python'
alias venv='virtualenv'
alias activate='source env/bin/activate'
alias jn='jupyter notebook'

## node.js alias
alias ts='tsc --target es6'

# homebrew
export PATH=:"/usr/local/bin:$PATH"

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

## ndenv
eval "$(ndenv init -)"

# python
export PIPENV_VENV_IN_PROJECT=1

# golang
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# dart & flutter
export PATH=$HOME/flutter/bin:$PATH
export PATH="$PATH":"~/.pub-cache/bin"
export PATH="/usr/local/opt/bison@2.7/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"

# elasticsearch
export ELASTICPATH=/usr/local/opt/elasticsearch/libexec/bin/
export PATH=$PATH:$ELASTICPATH
