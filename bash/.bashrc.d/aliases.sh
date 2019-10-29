
alias sudo='sudo '
alias ls='ls --color=auto -w 70'
alias ..='cd ..'
alias df='df -h'
alias du='du -ch'
alias ipp='curl ipinfo.io/ip'

if hash nvim 2>/dev/null; then
	alias vim='nvim'
fi

if hash neofetch 2>/dev/null; then
	alias neofetch='neofetch --ascii ~/.config/neofetch/ascii.txt'
fi

