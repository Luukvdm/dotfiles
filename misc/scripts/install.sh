# GENERAL
pacman -S firefox
pacman -S discord
pacman -S neovim
pacman -S vlc
pacman -S git
pacman -S neofetch
pacman -S tilix
pacman -S python-nautilus
pacman -S cmake # <- ook nodig voor CKB-next

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

# Corsair CKB-next driver
pacman -S quazip
git clone https://aur.archlinux.org/ckb-next.git

# GNOME
pacman -S gnome-tweaks

# Dash to dock
pacman -S intltool
git clone https://aur.archlinux.org/gnome-shell-extension-dash-to-dock.git
cd gnome-shell-extension-dash-to-dock/
makepkg
pacman -U gnome-shell-extension-dash-to-dock-66+141+g908a050-1-any.pkg.tar.xz
cd ../

