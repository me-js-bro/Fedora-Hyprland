#!/bin/bash

###### Hyprland Installation Script for Fedora Linux ######
#                                                         #
#         ███╗   ███╗ █████╗ ██╗  ██╗██╗███╗   ██╗        #
#         ████╗ ████║██╔══██╗██║  ██║██║████╗  ██║        #
#         ██╔████╔██║███████║███████║██║██╔██╗ ██║        #
#         ██║╚██╔╝██║██╔══██║██╔══██║██║██║╚██╗██║        #
#         ██║ ╚═╝ ██║██║  ██║██║  ██║██║██║ ╚████║        #
#         ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝        #
#                                                         #
###########################################################

# color defination
red="\e[1;31m"
green="\e[1;32m"
yellow="\e[1;33m"
blue="\e[1;34m"
megenta="\e[1;1;35m"
cyan="\e[1;36m"
end="\e[1;0m"

# initial texts
attention="${yellow}[ ATTENTION ]${end}"
action="${green}[ ACTION ]${end}"
note="${megenta}[ NOTE ]${end}"
done="${cyan}[ DONE ]${end}"
error="${red}[ ERROR ]${end}"

# Set the name of the log file to include the current date and time
log="Install-Logs/hypr_pkgs.log"

# install script dir
ScrDir=`dirname "$(realpath "$0")"`
source $ScrDir/1-global.sh

# main packages
hypr_package=( 
  curl
  firefox
  git
  gparted
  grim
  gwenview
  jq
  kitty
  kvantum
  libX11-devel
  libXext-devel
  lxappearance
  make
  network-manager-applet
  neofetch
  neovim
  pamixer
  pavucontrol
  pipewire-alsa
  polkit-gnome
  python3-requests
  python3-devel
  python3-pip
  qt5ct
  qt6ct
  qt6-qtsvg
  rofi-wayland
  slurp
  swappy
  tar
  unzip
  waybar
  wget
  wl-clipboard
  wlogout
  xdg-utils
  yad
)

# these are optional, 
hypr_package_2=(
  # brightnessctl
  btop
  cava
)

# packages from the copr repo
copr_packages=(
  cliphist
  pamixer
  swaylock-effects
  SwayNotificationCenter
  swww
)

# thunar file manager
thunar=(
  ffmpegthumbnailer
  file-roller
  gvfs
  gvfs-mtp 
  Thunar 
  thunar-volman 
  tumbler 
  thunar-archive-plugin
)

# url to install grimblast
grimblast_url=https://github.com/hyprwm/contrib.git


# Installation of main components
printf "${action} - Installing hyprland packages.... \n"

for PKG1 in "${hypr_package[@]}" "${hypr_package_2[@]}" "${copr_packages[@]}" "${thunar[@]}"; do
  install_package "$PKG1" "$log"
done

# installation of grimblast
if [ -f '/usr/local/bin/grimblast' ]; then
  printf "${done} - Grimblast is already installed...\n"
else

  printf "${attention} - Cloning grimblast grom github to install for screenshot...\n"
  git clone --depth=1 "$grimblast_url" ~/grimblast
  cd "$HOME/grimblast/grimblast"
  make
  sudo make install

  sleep 1
  rm -rf ~/grimblast
  printf "${done} - Grimblast was installed successfully"
fi

clear