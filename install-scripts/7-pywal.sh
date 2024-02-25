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
log="Install-Logs/pywal.log"

# install script dir
ScrDir=`dirname "$(realpath "$0")"`
source $ScrDir/1-global.sh

printf "${action} - Now installing pywal \n"
sudo pip3 install pywal 2>&1 | tee -a "$log"

sleep 1 && clear