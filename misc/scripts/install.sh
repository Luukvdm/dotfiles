pacman -S git

# Clone dotfiles to home dir
mkdir ~/dotfiles
git clone -q https://github.com/Luukvdm/dotfiles ~/dotfiles/

# Rename folders in home dir bcz I can
mv ~/Documents ~/documents
mv ~/Downloads ~/downloads
mv ~/Templates ~/templates
mv ~/Public ~/public
mv ~/Desktop ~/desktop
mv ~/Music ~/music
mv ~/Pictures ~/pictures
mv ~/Videos ~/videos
mkdir ~/code

# Init Stow
pacman -S stow

# Remove bash files so that stow can replace them
rm ~/.bash_profile
rm ~/.bashrc
rm ~/.config/user-dirs.dirs

stow -d ~/dotfiles *

# GENERAL
pacman -S firefox
pacman -S discord
pacman -S neovim
pacman -S vlc
pacman -S neofetch
pacman -S tilix
pacman -S python-nautilus
pacman -S cmake # <- ook nodig voor CKB-next
pacman -S python-pip

pip install neovim

# Setup git
git config --global credential.helper store

# Java
pacman -S jre8-openjdk-headless
pacman -S jdk8-openjdk

# Icon pack
pacman -S papirus-icon-theme

# AUR
pacman -S base-devel

# FONTS
pacman -S ttf-opensans
pacman -S ttf-font-awesome
pacman -S ttf-roboto
pacman -S ttf-hack

# Create dir to store cloned git repos
mkdir ~/to-install

# Corsair CKB-next driver
pacman -S quazip
git clone -q https://aur.archlinux.org/ckb-next.git ~/to-install/ckb-next

# GNOME
pacman -S gnome-tweaks

# Dash to dock
pacman -S intltool
git clone -q https://aur.archlinux.org/gnome-shell-extension-dash-to-dock.git ~/to-install/dash-to-dock
#cd gnome-shell-extension-dash-to-dock/
#makepkg
#pacman -U gnome-shell-extension-dash-to-dock-66+141+g908a050-1-any.pkg.tar.xz
#cd ../

# Install YouCompleteMe vim plugin
python ~/dotfiles/nvim/.vim/bundle/YouCompleteMe/install.py --cs-completer --ts-completer --java-completer

