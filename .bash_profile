##################################################
# @.bash_profile
# @Author: urchinhat
# @Update: date 2019/02/15
##################################################
# 1. Environment variable
##################################################
## GitHub
source .my_config/user_info 2> /dev/null
if [ -z $GITHUB_USER ] || [ -z $GITHUB_MAIL ]; then
    echo -e '\e[1;31m!!! Please input GITHUB_USER/GITHUB_MAIL(.my_config/user_info) !!!\e[m'
fi

## Common Config
export EDITOR="emacs -nw"
export HISTIGNORE='fg*:bg*:history*:cd*:hs*'

HISTSIZE=1000

##################################################
# 2. Display name
##################################################
if [ `uname` = 'Linux' ]; then
    # 2.1 Linux Display name
    ## Git(install apt)
    source /usr/lib/git-core/git-sh-prompt > /dev/null
    GIT_PS1_SHOWDIRTYSTATE=true

    PS1='\[\e[1;36m\][\u@\h \W$(__git_ps1 "(\033[32m\]%s\[\033[0m\]\[\e[1;36m\])")\]]$\[\e[m\] '
    # PS1="\[\e[1;36m\][\u@\h \W]\$\[\e[m\] "

elif [ `uname` = 'Darwin' ]; then
    # 2.2 MacOSX Display name 
    ## Git(install homebrew)
    source /usr/local/etc/bash_completion.d/git-prompt.sh > /dev/null
    source /usr/local/etc/bash_completion.d/git-completion.bash > /dev/null
    GIT_PS1_SHOWDIRTYSTATE=true
    PS1='[\u@\W$(__git_ps1 "(\033[32m\]%s\[\033[0m\])")\]]$ '
fi

##################################################
# 3. alias
##################################################
## 3.1 Common
alias sbp='source $HOME/.bash_profile'
alias emacs='emacs -nw'
alias e='emacs -nw'
alias em='emacs -nw'
alias vi='vim'
alias his='history'
alias hs='history | fgrep $1'
alias grep='grep --color'
alias fgrep='fgrep --color'
alias df='df -h'
alias gb='git branch'
alias gc='git checkout'
alias cl='clear'

## 3.2 Linux environment alias
if [ `uname` = 'Linux' ]; then
    echo "Linux's .bash_profile"
    alias ls='ls --color=auto'
    alias la='ls -ola'
    alias ll='ls -oh'
    
## 3.3 MaxOSX environment alias
elif [ `uname` = 'Darwin' ]; then
    echo "MacOSX's .bash_proile"
    alias ls='ls -G'
    alias la='ls -ola'
    alias ll='ls -olh'
fi

##################################################
# 4. Setting of package manager etc.
##################################################
## 4.1 Common before Setting
alias bl='brew list | tr \s \n'

## 4.2 Linux package manager setting
if [ `uname` = 'Linux' ]; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv) > /dev/null

## 4.3 MacOSX package manager setting
elif [ `uname` = 'Darwin' ]; then
    pass
fi

## 4.4 Common after Setting
eval "$(anyenv init -)"

##################################################
# 5. Setting for each programming language
# !!! anyenv is used for the language that can be installed with anyenv. !!!
##################################################
## Python
export PIPENV_VENV_IN_PROJECT=1

alias pip_all='pip freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs pip install -U'
alias py='python'
alias venv='virtualenv'
alias activate='source env/bin/activate'
alias jn='jupyter notebook'

## Golang
export GOPATH=$HOME/.go

## node.js

## C shrp

##################################################                                                                                           
# 98. Individual settings
# using: edit my_conf
##################################################
source .my_config/my_conf 2> /dev/null

##################################################
# 99. Settings added later
##################################################
