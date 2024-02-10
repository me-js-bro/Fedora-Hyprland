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

# List of COPR repositories to be added and enabled
COPR_REPOS=(
solopasha/hyprland
en4aew/desktop-tools
gloriouseggroll/kde6-f39 
trs-sod/swaylock-effects
alebastr/sway-extras
erikreider/SwayNotificationCenter  
)

# Set the name of the log file to include the current date and time
log="Install-Logs/copr.log"

# Function to add dnf config if not present in a file
add_config_if_not_present() {
  local file="$1"
  local config="$2"
  grep -qF "$config" "$file" || echo "$config" | sudo tee -a "$file" &>> /dev/null
}

# Check and add configuration settings to /etc/dnf/dnf.conf
add_config_if_not_present "/etc/dnf/dnf.conf" "max_parallel_downloads=5"
add_config_if_not_present "/etc/dnf/dnf.conf" "fastestmirror=True"
add_config_if_not_present "/etc/dnf/dnf.conf" "defaultyes=True"

# enabling 3rd party repo
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm &&


# Enable COPR Repositories 
for repo in "${COPR_REPOS[@]}";do 
  sudo dnf copr enable -y "$repo" 2>&1 | tee -a "$log" || { printf "${error} - Failed to enable necessary copr repos\n"; exit 1; }
done

clear
