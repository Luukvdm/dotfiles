# General 
alias \
    sudo='sudo ' \
    ls='ls --color=auto' \
    ..='cd ..' \
    df='df -h' \
    du='du -ch' \
    ipp='curl ipinfo.io/ip' \
    ip='ip -c' \
    serve='echo Live on: http://localhost:8000 && python -m http.server' \
    aliases='$EDITOR ~/dotfiles/bash/.bashrc.d/aliases.sh' \
    cp='cp -iv' \
    mv='mv -iv' \
    rm='rm -vI' \
    open='xdg-open'

alias \
    f='$FILE' \
    e='$EDITOR'

# Systemd aliases
alias \
    service='sudo systemctl' \
    userctl='systemctl --user' \
    restart='service restart' \
    status='systemctl status' \
    errors='journalctl -p err..alert --since "24 h ago"'

if type nvim &> /dev/null; then
	alias vim='nvim'
fi

if type git &> /dev/null; then
	alias gc='git commit'
	alias gco='git checkout'
	alias gs='git status -sb'
fi

if type docker &> /dev/null; then
    alias docker='sudo docker '
    alias dc='sudo docker-compose '
fi

if type neofetch &> /dev/null; then
	alias neofetch='neofetch --ascii ~/.config/neofetch/ascii.txt'
fi

if type mvn &> /dev/null; then
	alias mvn='mvn -gs "$XDG_CONFIG_HOME"/maven/settings.xml'
fi

