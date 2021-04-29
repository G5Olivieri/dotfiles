# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

# Start tmux
if [[ -z "$TMUX" ]]; then
  tmux attach-session -t $USER || tmux new-session -s $USER
fi

get_current_branch() {
	local current_branch
	current_branch="$(git branch --show-current 2> /dev/null)"
	if [ -z "$current_branch" ]; then
		echo -n " "
		return
	fi
	echo -n " ($current_branch) "
}

reset_color="\e[m"
blue="\e[0;34m"
green="\e[0;32m"
red="\e[0;31m"
export PS1="\[${blue}\]\u:\[${reset_color}\]\[${green}\]\w\[${reset_color}${red}\]\$(get_current_branch)\[${reset_color}\]$ "

test -s ~/.alias && . ~/.alias || true
