DOTFILES="$HOME/Data/dotfiles"
fpath=( "$DOTFILES/zsh/zfunctions" $fpath )

eval $(dircolors $DOTFILES/dircolors)

# Start tmux
if [[ -z "$TMUX" ]]; then
  tmux attach-session -t $USER || tmux new-session -s $USER
fi

bindkey -e
setopt autocd

autoload -U colors && colors
autoload -U edit-command-line && zle -N edit-command-line
autoload -U url-quote-magic && zle -N self-insert url-quote-magic

# edit-command-line
zmodload zsh/terminfo
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

# prompt
autoload -U promptinit && promptinit
prompt pure

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell"
[ -n "$PS1" ] && \
	[ -s "BASE16_SHELL/profile_helper.sh" ] && \
		eval "$("$BASE16_SHELL/profile_helper.sh")"

# sources
source "$HOME/Data/dotfiles/zsh/completion.zsh"
source "$HOME/Data/dotfiles/zsh/git.zsh"
source "$HOME/Data/dotfiles/zsh/aliases.zsh"

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Less highlight
function cless() {
  pygmentize -g -O style=monokai -f console256 -g $1 | less -R
}

# cat highlight
alias ccat='pygmentize -g -O style=monokai -f console256 -g'

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh

export PATH="$PATH:$HOME/.local/bin"
