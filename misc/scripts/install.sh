sudo pacman -S git

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
sudo pacman -S stow

# Remove bash files so that stow can replace them
rm ~/.bash_profile
rm ~/.bashrc
rm ~/.config/user-dirs.dirs

stow -d ~/dotfiles *

# GENERAL
sudo pacman -S firefox discord neovim vlc neofetch tilix python-nautilus cmake python-pip

pip install neovim

# Setup git
git config --global credential.helper store

# Java
sudo pacman -S jre8-openjdk-headless jdk8-openjdk

# Icon pack
sudo pacman -S papirus-icon-theme

# AUR
sudo pacman -S base-devel

# FONTS
sudo pacman -S ttf-opensans ttf-font-awesome ttf-roboto ttf-hack

# Create dir to store cloned git repos
mkdir ~/to-install

# Corsair CKB-next driver
sudo pacman -S quazip
git clone -q https://aur.archlinux.org/ckb-next.git ~/to-install/ckb-next

# GNOME
sudo pacman -S gnome-tweaks

# Dash to dock
sudo pacman -S intltool
git clone -q https://aur.archlinux.org/gnome-shell-extension-dash-to-dock.git ~/to-install/dash-to-dock
#cd gnome-shell-extension-dash-to-dock/
#makepkg
#pacman -U gnome-shell-extension-dash-to-dock-66+141+g908a050-1-any.pkg.tar.xz
#cd ../

# Install YouCompleteMe vim plugin
python ~/dotfiles/nvim/.vim/bundle/YouCompleteMe/install.py --cs-completer --ts-completer --java-completer

