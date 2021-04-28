get_current_branch() {
	local current_branch
	current_branch="$(git branch --show-current 2> /dev/null)"
	if [ -z "$current_branch" ]; then
		echo -n " "
		return
	fi
	echo -n " ($current_branch) "
}

export PS1="\e[0;32m\u:\e[0m\e[0;34m\w\e[0m\e[0;31m\$(get_current_branch)\e[0m$ "
