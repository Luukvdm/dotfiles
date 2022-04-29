#!/bin/zsh

export ZSH=$XDG_CONFIG_HOME/oh-my-zsh
export ZSH_CACHE_DIR=$XDG_CACHE_HOME/oh-my-zsh

#if [ ! -d "$ZSH" ]; then
#    local REMOTE=${REMOTE:-ssh://git@github.com/${REPO}.git} 
#    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
#    curl -L https://raw.githubusercontent.com/sbugzu/gruvbox-zsh/master/gruvbox.zsh-theme > $ZSH/custom/themes/gruvbox.zsh-theme
#    rm ~/.zshrc
#    mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
#fi

install-oh-my-zsh()
{
    if [ -d "$XDG_CONFIG_HOME/oh-my-zsh-files" ] 
    then
	local REMOTE=${REMOTE:-ssh://git@github.com/${REPO}.git} 
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

	# This needs more testing ...
	# rsync -a $XDG_CONFIG_HOME/oh-my-zsh-files $ZSH
	# rm -rf $XDG_CONFIG_HOME/oh-my-zsh-files
	echo Dont forget to move "$XDG_CONFIG_HOME"/oh-my-zsh-files into "$ZSH"

	curl -L https://raw.githubusercontent.com/sbugzu/gruvbox-zsh/master/gruvbox.zsh-theme > $ZSH/custom/themes/gruvbox.zsh-theme
    fi
}

# install-oh-my-zsh

ZSH_THEME="gruvbox"
SOLARIZED_THEME="dark"
DISABLE_AUTO_UPDATE="true"

# Need to maybe change between Arch Linux plugin and MacOS plugins depending on OS
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/macos
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux
plugins=(git git-auto-fetch archlinux golang kubectl minikube docker-compose docker)

# Enable colors and change prompt:
autoload -U colors && colors
# color='\033[38;5;220m\]'
#color="#d79921"
#hostnameColor='\033[38;5;214m\]'
#if [ $(id -u) -eq 0 ]; then # root
#    color='\033[38;5;214m\]'
#fi

#if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
#    PS1=" \[$(tput sgr0)\]\[$hostnameColor\h\[$(tput sgr0)\] \[$(tput bold)\]\[$(tput sgr0)\]\[$color\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[#96fc07 \[$(tput sgr0)\]"
#else
#    PS1=" \[$(tput bold)\]\[$(tput sgr0)\]\[$color\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[#d79921 \[$(tput sgr0)\]"
#fi

# PS1=" \[$(tput sgr0)\]\[$hostnameColor\h\[$(tput sgr0)\] \[$(tput bold)\]\[$(tput sgr0)\]\[$color\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
PS1="%B %{$fg[green]%}%~%{$reset_color%}%b "

setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

bindkey "\033[1~" beginning-of-line
bindkey "\033[4~" end-of-line

# zsh parameter completion for the dotnet CLI
_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  reply=( "${(ps:\n:)completions}" )
}
compctl -K _dotnet_zsh_complete dotnet

if [[ ! -d $ZSH_CACHE_DIR ]]; then
    mkdir $ZSH_CACHE_DIR
fi
source $ZSH/oh-my-zsh.sh

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
