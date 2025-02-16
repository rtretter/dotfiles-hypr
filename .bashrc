# If not running interactively, don't do anything
[[ $- != *i* ]] && return

###############
### ALIASES ###
###############

alias sudo='sudo -Es'
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'

function nv() {
    if [[ $# -eq 0 ]]; then
        # No args passed
        nvim .
    else
        # Append args
        nvim "$@"
    fi
}

#################
### VARIABLES ###
#################

PS0=""
PS1="\n┌[\[$(tput setaf 216)\]\t\[\e[0m\]] \[$(tput setaf 147)\]\u\[$(tput setaf 255)\]@\[$(tput setaf 216)\]\h\[\e[m\] \[$(tput setaf 147)\]\w\n\[\e[0m\]└─○ $\[\e[0m\] "

clear
echo $(whoami) @ $(date)
