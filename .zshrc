autoload -Uz compinit && compinit

setopt autocd

# Completion
zstyle ':completion:*' menu select # selectable menu
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}' 'r:|=*' 'l:|=* r:|=*'  # case insensitive completion
zstyle ':completion:*' special-dirs true # Complete . and .. special directories
zstyle ':completion:*' list-colors '' # colorize completion lists
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01' # colorize kill list

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

[ -f ~/.zsh/zsh-vi-mode/zsh-vi-mode.zsh ] && source ~/.zsh/zsh-vi-mode/zsh-vi-mode.zsh
# Define an init function and append to zvm_after_init_commands
function add_keybindings() {
  source <(fzf --zsh)
  [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
}
zvm_after_init_commands+=(add_keybindings)

[ -f ~/.zsh/history.zsh ] && source ~/.zsh/history.zsh
[ -f ~/.zsh/aliases.zsh ] && source ~/.zsh/aliases.zsh
[ -f ~/.zsh/env.zsh ] && source ~/.zsh/env.zsh

fpath=(/home/$USER $fpath)

source /usr/share/nvm/init-nvm.sh

# Load Angular CLI autocompletion.
source <(ng completion script)

# Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
type starship_zle-keymap-select >/dev/null || eval "$(starship init zsh)"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/alberto/.lmstudio/bin"
