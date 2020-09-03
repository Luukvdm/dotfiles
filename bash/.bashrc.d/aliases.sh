
alias sudo='sudo '
alias ls='ls --color=auto -w 70'
alias ..='cd ..'
alias df='df -h'
alias du='du -ch'
alias ipp='curl ipinfo.io/ip'
alias ip='ip -c'
alias gitlog='git log --stat --pretty=short --graph'
alias serve='echo Live on: http://localhost:8000 && python -m http.server && open http://localhost:8000'
alias aliases='vim ~/dotfiles/bash/.bashrc.d/aliases.sh'

# Systemd dingen
alias service='sudo systemctl'
alias userctl='systemctl --user'
alias restart='service restart'
alias status='systemctl status'

# Logging dingen
alias errors='journalctl -p err..alert --since "24 h ago"'

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

if type docker &> /dev/null; then
    alias docker='sudo docker '
    alias dc='sudo docker-compose '
fi

