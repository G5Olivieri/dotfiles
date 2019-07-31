alias cp='cp -i'
alias dir='dir --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias mv='mv -i'
alias rm='rm -i'
alias vdir='vdir --color=auto'
alias vi='vim'
alias dc='docker-compose'
alias dcr='docker-compose run --rm'

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -lah'

alias cc='xclip -selection clipboard'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias dc='docker-compose'
alias dcr='docker-compose run --rm'

