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
log="Install-Logs/install_xdph.log"

# install script dir
ScrDir=`dirname "$(realpath "$0")"`
source $ScrDir/1-global.sh

xdg=(
xdg-desktop-portal-hyprland
xdg-desktop-portal-gtk
)


# XDG-DESKTOP-PORTAL-HYPRLAND
for xdgs in "${xdg[@]}"; do
  install_package "$xdgs" "$log"
done

printf "\n"

printf "${note} - Checking for other XDG-Desktop-Portal-Implementations....\n"
sleep 1
printf "\n"
printf "${note} - XDG-desktop-portal-KDE & GNOME (if installed) should be manually disabled or removed!\n"

while true; do
    printf "${attention} - Would you like to try to remove other XDG-Desktop-Portal-Implementations? (y/n) "
    read -n1 -rep "Select: " XDPH1
    sleep 1

    case $XDPH1 in
        [Yy])
            # Clean out other portals
            printf "${note} - Clearing any other xdg-desktop-portal implementations...\n"
            # Check if packages are installed and uninstall if present
  			if sudo dnf list installed xdg-desktop-portal-wlr &>> /dev/null; then
    		echo "Removing xdg-desktop-portal-wlr..."
    		sudo dnf remove -y xdg-desktop-portal-wlr 2>&1 | tee -a "$log" &>> /dev/null
  			fi

  			if sudo dnf list installed xdg-desktop-portal-lxqt &>> /dev/null; then
    		echo "Removing xdg-desktop-portal-lxqt..."
    		sudo dnf remove -y xdg-desktop-portal-lxqt 2>&1 | tee -a "$log" &>> /dev/null
  			fi

            break
            ;;
        [Nn])
            echo "no other XDG-implementations will be removed." 2>&1 | tee -a "$log" &>> /dev/null
            break
            ;;
        *)
            echo "Invalid input. Please enter 'y' for yes or 'n' for no."
            ;;
    esac
done
clear