# Git(apt install git)
source /usr/lib/git-core/git-sh-prompt > /dev/null
GIT_PS1_SHOWDIRTYSTATE=true

# PS1
PS1='\[\e[1;36m\][\u@\h \W$(__git_ps1 "(\033[32m\]%s\[\033[0m\]\[\e[1;36m\])")\]]$\[\e[m\] '
# PS1="\[\e[1;36m\][\u@\h \W]\$\[\e[m\] "

# bash_history
HISTSIZE=1000
export HISTIGNORE="fg*:bg*:history*:cd*:hs*"

# config
export EDITOR="emacs -nw"

# alias
alias emacs='emacs -nw'
alias e='emacs -nw'
alias em='emacs -nw'
alias pip_all='pip freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs pip install -U'
alias sbp='exec $SHELL -l'
alias gb='git branch'
alias gc='git checkout'
alias ls='ls --color=auto'
alias la='ls -oa'
alias ll='ls -oh'
alias cl='clear'
alias grep='grep --color'
alias fgrep='fgrep --color'
alias df='df -h'
alias host_name='ssh -i ~/.ssh/id_rsa -p 22 -l hoge example.com'
alias loghttpd='cd /var/log/httpd/$(date +%Y)/$(date +%m)/$(date +%d)/'
alias vi='vim'
alias his='history'
alias csp='mcs'
alias hs='history | fgrep $1'
alias py='python'
alias venv='virtualenv'
alias atv='source env/bin/activate'
alias google='lynx https://www.google.co.jp/'

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
