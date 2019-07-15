if [[ ! -d "$DOTFILES/zsh/vendor/zsh-autosuggestions" ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $DOTFILES/zsh/vendor/zsh-autosuggestions
fi

source $DOTFILES/zsh/vendor/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -Uz compinit && compinit
zmodload -i zsh/complist

zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

unsetopt menu_complete
unsetopt flowcontrol

