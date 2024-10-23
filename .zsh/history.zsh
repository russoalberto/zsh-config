HISTSIZE=10000000
HISTFILE=$HOME/.zsh_history
SAVEHIST=10000000
setopt appendhistory
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt extended_history

# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
