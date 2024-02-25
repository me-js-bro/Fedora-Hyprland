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

### Because I'm on a Desktop Computer and I don't have a laptop, I could not test scripts for the blurtooth brightness control and other festures...

### I have took some of the scripts and made some changes from "Sol Does Tech" and "JaKooLit" hyprland dotfiles. here are the links of their dotfiles.

# color defination
red="\e[1;31m"
green="\e[1;32m"
yellow="\e[1;33m"
blue="\e[1;34m"
megenta="\e[1;1;35m"
cyan="\e[1;36m"
end="\e[1;0m"



clear
sleep 1

printf " Welcome to the Hyprland Installation Script by,\n"
sleep 1
printf " \n"
printf " \n"
printf " |\  /|   /\   |    | 0 |\   |   \n"
printf " | \/ |  /  \  |____| | | \  |   \n"
printf " |    | /----\ |    | | |  \ |   \n"
printf " |    |/      \|    |_|_|   \|   \n"
printf " \n"
printf " \n"

sleep 1


# all the installation scripts
install_script_dir=./install-scripts
chmod +x "$install_script_dir"/*


# initial texts
attention="${yellow}[ ATTENTION ]${end}"
action="${green}[ ACTION ]${end}"
note="${megenta}[ NOTE ]${end}"
done="${cyan}[ DONE ]${end}"
error="${red}[ ERROR ]${end}"

### Ask user for the confirmation...###
printf "${attention} - Would you like to continue with the installer script? [ y/n ]\n"
read -p "Select: " ok_script

if [[ $ok_script == "Y" || $ok_script == "y" ]]; then
    clear
    printf "${action} - Starting installation script..\n"
    sleep 1
    clear
else
    printf "${error} - This script will exit now,${yellow} no changes were made to your system. Exiting from the script...${end}\n"
    exit 1
fi

# creating install log dir
    mkdir -p Install-Logs
    log="Install-Logs/install_main.log"

sleep 1
clear

#-------- Asking some prompts --------#

## Install Packages
printf "${note} - Would you like to install the packages? [ y/n ]\n"
read -n1 -rep "Select: " INST_PKGS
printf " \n"

## Install and enable bluetooth service
printf "${note} - Would you like to install and enable Bluetooth service? [ y/n ]\n"
read -n1 -rep "Select: " bluetooth
printf " \n"

## Installing openbangla keyboard and ibus
printf "${note} - Would like to install Openbangla keyboard and ibus to write in Bangla? [ y/n ]\n"
read -n1 -rep "Select: " BANGLA
printf " \n"

## Copy configs
printf "${note} - Would you like to copy config files? [ y/n ]\n"
read -n1 -rep "Select: " CFG
printf " \n"

## Config sddm theme
printf "${note} - Would you like to install sddm as login manager? ( Don't select "y" if you already have any other login manager.) [ y/n ]\n"
read -n1 -rep "Select: " SDDM_CFG
printf " \n"

## Install zsh, oh-my-zsh and powerleven10k theme
printf "${note} - Would like to install zsh, oh-my-zsh and powerlevel10k theme on your system? [ y/n ]\n"
read -n1 -rep "Select: " zsh
printf " \n"

## Config Vs Code theme
printf "${note} - Would you like to install configure Vs-Code ( Visual Studio Code )? [ y/n ]\n"
read -n1 -rep "Select: " code
printf " \n"

## Config GTK themes
printf "${note} - Would like to install gtk light and dark and qt5 theme on your system? [ y/n ]\n"
read -n1 -rep "Select: " theme
printf " \n"


# Update system before proceeding
printf "${action} - Updating the full system before proceeding to the next step...\n"

# sudo dnf upgrade --refresh
printf "${done} - The system has been updated successfully, proceeding to the next step...\n"
printf "[ DONE ] - The system has been updated successfully.\n" 2>&1 | tee -a "$log" &>> /dev/null

clear


if [[ $INST_PKGS == "Y" || $INST_PKGS == "y" ]]; then

    "$install_script_dir/2-copr.sh"       # copr repo
   "$install_script_dir/3-hyprland.sh"      # fonts
   "$install_script_dir/4-hypr_pkgs.sh"  # Main packages
   "$install_script_dir/5-fonts.sh"      # fonts
   "$install_script_dir/6-nwgLook.sh" # nwg-look
   "$install_script_dir/7-pywal.sh" # pywal

    if [[ $bluetooth == "y" || $bluetooth == "Y" ]]; then
        "$install_script_dir/bluetooth.sh"  # install and setup bluetooth
    else
        printf "${attention} - Bluetooth services wont be installed...\n"
        printf "[ ATTENTION ] - Bluetooth services wont be installed\n" 2>&1 | tee -a "$log" &>> /dev/null
    fi

    if [[ $BANGLA == "y" || $BANGLA == "Y" ]]; then
        "$install_script_dir/write_bangla.sh"   # install openbangla keyboard and some bangla fonts
    else
        printf "${attention} - Openbangla Keyboard and some Bangla Fonts wont be installed...\n"
        printf "[ ATTENTION ] - Openbangla Keyboard and some Bangla Fonts wont be installed\n" 2>&1 | tee -a "$log" &>> /dev/null
    fi
else
    printf "${attention} - Packages were not installed. Exiting the script here\n"
    printf "[ ATTEENTION ] - Packages were not installed. Exiting the script here \n" 2>&1 | tee -a "$log" &>> /dev/null
    exit 1
fi


# Copy Config Files
if [[ $CFG == "Y" || $CFG == "y" ]]; then
    "$install_script_dir/dotfiles.sh"

else
    printf "${error} - Copying dotfiles cancled\n"
    printf "[ ERROR ] - Copying dotfiles cancled\n" 2>&1 | tee -a "$log" &>> /dev/null
fi


# Set SDDM Theme
if [[ $SDDM_CFG == "y" || $SDDM_CFG == "Y" ]]; then
    "$install_script_dir/sddm.sh"
else
    printf "${error} - Setting up the SDDM theme cancled\n"
    printf "[ ERROR ] - Setting up the SDDM theme cancled\n" 2>&1 | tee -a "$log" &>> /dev/null
fi

clear


# Installing zsh and oh-my-zsh
if [[ $zsh == "y" || $zsh == "Y" ]]; then
    "$install_script_dir/zsh.sh"
else
    printf "${error} - Installing and setting up the zsh is cancled\n"
    printf "[ ERROR ] - Installing and setting up the zsh is cancled\n" 2>&1 | tee -a "$log" &>> /dev/null
fi




# Vs Code Theme Set
if [[ $code == "y" || $code == "Y" ]]; then
    "$install_script_dir/code-oss.sh"
else
    printf "${error} - Configuring vs-code is cancled\n"
    printf "[ ERROR ] - Configuring vs-code is cancled\n"  2>&1 | tee -a "$log" &>> /dev/null
fi



# GTK themes installation
if [[ $theme == "y" || $theme == "Y" ]]; then
    printf "${action} - Installing GTK theme..\n"
    "$install_script_dir/themes.sh"
else
    printf "${error} - Installing gtk theme has cancled\n"
    printf "[ ERROR ] - Installing gtk theme has cancled\n" 2>&1 | tee -a "$log" &>> /dev/null
fi

# setting graphical interface
sudo systemctl set-default graphical.target &>> /dev/null

# starting sddm ( if installed )
if sudo dnf list installed sddm &>> /dev/null ; then
    printf "${note} - Enabling the SDDM Service...\n"
    sudo systemctl enable sddm.service &>> /dev/null
    sleep 2
fi

# finishing of the script
printf "${done} - installation completed, would you like to rebooting your system...[ y/n ]\n"
read -p "Select: " REBOOT

if [[ $REBOOT == "Y" || $REBOOT == "y" ]]; then
    printf "${note} - Syste will reboot now..\n"
    sleep 1
    reboot
else
    exit 1
fi

############## Script exits here ################
