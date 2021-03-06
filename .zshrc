autoload -U colors && colors

PROMPT="%{$fg[green]%}%n%{$reset_color%}@%{$fg[red]%}%m%{$reset_color%}:%{$fg_no_bold[yellow]%}%d%{$reset_color%}$ "
#RPROMPT="[%{$fg_no_bold[yellow]%}%d%{$reset_color%}]"

zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

alias ls='ls --color=auto'
alias ll='ls --color=auto -alh'
alias lk='ls --color=auto -lh'
alias gags='git add --all && git status'
alias gs='git status'
alias gd='git diff'
alias gp='git push'
alias gagcm='git add --all && git commit -mm'
alias grepr='grep --color=auto -RHIn'
alias pss='ps aux|grep'
alias install='sudo apt install -y'
alias purge='sudo apt purge -y'
alias sysupd='sudo apt update && sudo apt dist-upgrade -y && sudo apt autoremove -y'
alias rrm='rm -rf'
alias rrrm='sudo rm -rf'
alias gitka='gitk --all'
alias ccp='cp -r'
alias lns='loadnvm && npm start'
alias tlpn='sudo netstat -tlpn'
alias c.='code .'
alias g='gpicview'

{% if host == "flondra" %}
alias ftl=`cd FTL\ Faster\ Than\ Light && ./FTL`
{% endif %}

setxkbmap pl

export GOPATH=~/gopath
PATH=$PATH:{{home}}/scripts:/opt/arm/bin:{{home}}/.cabal/bin:/usr/local/share/scala/bin:/usr/local/share/spark/bin:$GOPATH/bin:{{home}}/.local/bin/:/usr/local/cuda/bin:/usr/local/go/bin:/home/dzastin/.local/bin:$HOME/.config/composer/vendor/bin:$HOME/.cargo/bin

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

setopt autocd 

#This is for auto ls after cding
function chpwd() {
    emulate -LR zsh
    ls
}

function wp {
    echo `pwd` > /var/lib/path/p$1
}

function rp {
    cd "`cat /var/lib/path/p$1`"
}

function pp {
    cat /var/lib/path/p$1
}

if [ $(tty) = "/dev/tty1" ]; then
    startx
fi

HISTFILE=~/.zsh_history
SAVEHIST=999999999
HISTSIZE=999999999

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt rm_star_silent
export NVM_DIR="{{home}}/.nvm"
function loadnvm {
    echo "loading nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
}

function c0 {
    dead=`service mongodb status`
    deadgrepped=`echo $dead|grep dead`
    if [[ -z "${deadgrepped// }" ]]; then
        echo "mongo not dead"
    else
        echo "mongo dead"
        sudo service mongod start
    fi
    rp sc && godo -w
}
