#
# ~/.bashrc
#

export TERMINAL="alacritty"
export READER="zathura"
export BROWSER="firefox"
export EDITOR="nvim"

# XDG dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

for FN in ~/.config/bash/*.sh ; do
    source "$FN"
done

color='\033[38;5;220m\]'
hostnameColor='\033[38;5;214m\]'
if [ $(id -u) -eq 0 ]; then # root
    color='\033[38;5;214m\]'
fi

# When using ssh
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    PS1=" \[$(tput sgr0)\]\[$hostnameColor\h\[$(tput sgr0)\] \[$(tput bold)\]\[$(tput sgr0)\]\[$color\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
else
    PS1=" \[$(tput bold)\]\[$(tput sgr0)\]\[$color\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
fi

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

if type sway &> /dev/null; then
    # If not running interactively, don't do anything
    [[ $- != *i* ]] && return

    # If running from tty1 start sway
    if [[ "$(tty)" == "/dev/tty1" ]]; then
	# https://github.com/systemd/systemd/issues/14489
	XDG_SESSION_TYPE=wayland _JAVA_AWT_WM_NONREPARENTING=1 exec systemd-cat -t sway sway
    fi
fi
