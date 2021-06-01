# Arch install notes

## Installtion
**Partitioning**  
Parted
```bash
fdisk -l
# cfdisk for noobs
fdisk /dev/sdx

mkfs.ext4 /dev/sdx2
mkswap /dev/sdx1

mount /dev/sdx2 /mnt
swapon /dev/sdx1
```

**Base system stuff**  
Pick a [kernel](https://wiki.archlinux.org/index.php/Kernel).
Maybe pick some [networking software](https://wiki.archlinux.org/index.php/Network_configuration#Network_managers), prob install NetworkManager or use systemd-networkd.
```bash
pacstrap /mnt base <kernel> linux-firmware sudo neovim git man-db man-pages
```

**Networking stuff**  
```bash
# For systemd
systemctl enable systemd-networkd
systemctl enable systemd-resolved
```

**Create a user**  
```bash
useradd -mg users -G wheel,storage,power,video,audio,input -s /bin/bash <username>
passwd <username>
# also edit /etc/sudoers
```
Disable root login if you want.
```https
https://wiki.archlinux.org/index.php/Sudo#Disable_root_login
```

**Set default shell**  
Pick a shell (bash, zsh, fish, etc.).  
Some urls:
```https
https://wiki.archlinux.org/index.php/Bash
https://wiki.archlinux.org/index.php/Zsh
https://wiki.archlinux.org/index.php/Fish
https://wiki.archlinux.org/index.php/Command-line_shell#Changing_your_default_shell
```

## Booting
**Microcode**  
Remember to upgrade the microcode with the package.

**Numlock**
```https
https://wiki.archlinux.org/index.php/Activating_numlock_on_bootup
```

## Packages and mirrors
**Pacman config**  
Enable colors etc.
```bash
vim /etc/pacman.conf
```

```conf
[options]
Color
ParallelDownloads = 5
```

**Reflector**  
Reflector updates the mirror list automaticly.   
```bash
pacman -S reflector
# Add "Netherlands" to countries
sudo vim /etc/xdg/reflector/reflector.conf
sudo systemctl start reflector.timer
sudo systemctl enable reflector.timer
```

**AUR**  
```bash
sudo pacman -S --needed git base-devel
# Update config for performance
sudo vim /etc/makepkg.conf
```

**Install yay**  
If lazy, install yet another yoghurt as AUR helper.  
```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
# Sometimes pacman -U is needed instead of -i
# pacman -U package_name.pkg.tar.xz
```

## Stuff
**SSD**  
```bash
sudo pacman -S util-linux
# Check when using disc encryption with dm-crypt
# https://wiki.archlinux.org/index.php/Dm-crypt/Specialties#Discard/TRIM_support_for_solid_state_drives_(SSD)
sudo systemctl enable fstrim.timer
```

**Fonts**  
```bash
sudo pacman -S ttf-font-awesome otf-font-awesome \
	       ttf-hack ttf-opensans ttf-roboto
```

**Firewall**  
```bash
ufw --force reset > /dev/null
ufw default allow outgoing
ufw default deny incoming
ufw enable
```

**Sway stuff**  
```bash
pacman -S sway swaylock waybar wofi qt5-wayland mako
# Terminal
pacman -S alacritty
# Audio controls
pacman -S pavucontrol
# xorg server
pacman -S xorg-server-xwayland
```

**Gnome stuff**  
Change terminal in .bashrc for tilix as default.
```bash
pacman -S gnome-shell-extensions
yay -S gnome-shell-extension-dash-to-dock gnome-shell-extension-gsconnect
pacman -S tilix gnome-tweaks python-nautilus
```

**Gtk stuff**  
```bash
yay -S gtk-theme-arc-gruvbox-git
```

**Audio**  
```bash
pacman -S pulseaudio pulseaudio-alsa pulseaudio-bluetooth pamixer
systemctl --user enable pulseaudio.service
systemctl --user start pulseaudio.service
```

Playerctl, spotify etc.
```bash
pacman -S playerctl spotifyd
yay -S spotify-tui
vim ~/.config/spotifyd/spotifyd.conf
curl -L -o ~/.config/systemd/user/spotifyd.service https://raw.githubusercontent.com/Spotifyd/spotifyd/master/contrib/spotifyd.service
systemctl --user enable spotifyd.service
systemctl --user start  spotifyd.service
```

**Firefox**  
Install firefox plus addons.  
```bash
pacman -S firefox
pacman -Ss firefox-addons
pacman -S firefox-ublock-origin firefox-umatrix \
    firefox-extension-privacybadger firefox-extension-https-everywhere \
    firefox-dark-reader firefox-decentraleyes
```
For Wayland, set env var.  
```bash
export MOZ_ENABLE_WAYLAND=1
```

**Stuff**  
```bash
pacman -S light papirus-icon-theme neofetch vlc
# Need yarn for neovim plugin
pip install neovim
pacman -S yarn 
```
