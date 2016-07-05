# History remembers what you have written
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Disable the annoying C-s that stops output
stty -ixon

# Nice prompt
export PS1="\n\[\e[32;1m\](\[\e[37;1m\]\t\[\e[32;1m\])-(\[\e[37;1m\]\u@\H\[\e[32;1m\])-(\[\e[37;1m\]jobs:\j\[\e[32;1m\])-(\[\e[37;1m\]\w\[\e[32;1m\])\n(\[\[\e[37;1m\]!\!\[\e[32;1m\])-> \[\e[0m\]"

# Some nice aliases
alias ls="ls --color -F"
alias la="ls -a"
alias lla="ll -a"
alias grep="grep --color"
alias vim="vim -X"
alias vimdiff="vimdiff -X"

export EDITOR="vim -X"

function cd {
  builtin cd "$@" && ls;
}

# case insensitive paths
shopt -s nocaseglob


if [ -f $HOME/.dir_colors ] 
then
  eval `dircolors -b $HOME/.dir_colors`
fi
