OS := $(shell uname)
MAC_IGNORE := Makefile|environment.d|gtk.*|tilix|user-dirs.dirs
SWAY_CONFIG := sway|waybar|wofi|alacritty|mako|light|swaylock

# Install all basic packages
packages: install.deps
ifneq (, $(shell type pacman))
	sudo pacman --noconfirm -S neovim zsh neofetch
else
ifneq (, $(shell type apt))
	sudo apt -y install neovim neofetch zsh
ifneq (, $(shell type brew))
	brew install neofetch neovim zsh bash
endif
endif
endif

# Install oh-my-zsh https://ohmyz.sh/#install
ohmy:
	# Todo check if dir already exist and delete it and after install restow it
	ZSH=$(HOME)/.config/oh-my-zsh sh -c "$$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install basic dependencies
install.deps:
ifeq ($(OS),Darwin)
	# Install brew
ifeq (, $(shell type brew))
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
endif
endif

ifneq (, $(shell type pacman))
	sudo pacman --noconfirm -S stow git
else
ifneq (, $(shell type apt))
	sudo apt install stow git
ifneq (, $(shell type brew))
	brew install stow git
endif
endif
endif

# Install dotfiles with basic dependencies
install: install.deps
ifeq ($(OS),Darwin)
	# Ignore linux and sway stuff when on MacOS
	stow --restow --ignore '($(MAC_IGNORE)|$(SWAY_CONFIG))' --no-folding --dir="${HOME}/dotfiles" .
else
	stow --restow --ignore '(Makefile|$(SWAY_CONFIG))' --no-folding --dir="${HOME}/dotfiles" .
endif

# Full install packages, oh-my-zsh, dotfiles
install.full: | install.deps packages ohmy install

# Install everything for sway desktop 
install.sway: install.deps packages ohmy
ifneq (, $(shell type pacman))
	sudo pacman --noconfirm -S sway swaylock waybar wofi mako alacritty pavucontrol xorg-server-xwayland light
else
ifneq (, $(shell type apt))
	sudo apt install sway swaylock waybar wofi mako alacritty pavucontrol xorg-server-xwayland light
endif
endif
	stow --restow --ignore '(Makefile)' --no-folding --dir="${HOME}/dotfiles" .

