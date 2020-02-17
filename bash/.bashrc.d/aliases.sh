
alias sudo='sudo '
alias ls='ls --color=auto -w 70'
alias ..='cd ..'
alias df='df -h'
alias du='du -ch'
alias ipp='curl ipinfo.io/ip'
alias ip='ip -c'

#if type pacman &> /dev/null; then
    # alias pacman -Syu ='sudo pacman -Syu'
    # alias pacman -S ='sudo pacman -S'
#fi

if type nvim &> /dev/null; then
	alias vim='nvim'
fi

if type neofetch &> /dev/null; then
	alias neofetch='neofetch --ascii ~/.config/neofetch/ascii.txt'
fi

