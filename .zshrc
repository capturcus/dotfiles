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
alias grepr='grep --color=auto -RHIn'
alias pss='ps aux|grep'

setxkbmap pl

PATH=$PATH:/home/marcin/scripts

setopt autocd 

#This is for auto ls after cding
function chpwd() {
    emulate -LR zsh
    ls
}

#if [ "$TMUX" = "" ]; then tmux; fi
