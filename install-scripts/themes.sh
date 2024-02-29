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

# Install THEME
CONFIG_DIR=$HOME/.config
THEME='extras/theme.tar.gz'
ICON='extras/Icon_TelaDracula.tar.gz'
KVANTUM='extras/Kvantum'
GTK3='extras/gtk-3.0'
GTK4='extras/gtk-4.0'
QT5CT='extras/qt5ct'
cursor='extras/Nordzy-cursors.tar.gz'

log="Install-Logs/themes.log"


# creating icons and theme directory
mkdir -p ~/.themes
mkdir -p ~/.icons

# backing up the qt5ct dir
qt5ct=~/.config/qt5ct
if [ -d "$qt5ct" ]; then
    printf "${action} - Backing up qt5ct Configs...\n"
    mv "$qt5ct" "$qt5ct-back"
fi
sleep 1

# copying the qt5ct dir
cp -r $QT5CT ~/.config/
printf "${done} - Copying qt5ct themes done...\n"


# kvantum dir
KVANTUM_DIR=~/.config/Kvantum
if [ -d $KVANTUM_DIR ]; then
    printf "${action} - Backing up Kvantum Configs...\n"
    mv $KVANTUM_DIR "$KVANTUM_DIR-back"
fi
sleep 1

cp -r $KVANTUM ~/.config/
printf "${done} - Copying Kvantum themes done...\n"

# gtk 3 dir, backup and copy
GTK3_DIR=~/.config/gtk-3.0
if [ -d $GTK3_DIR ]; then
    mv $GTK3_DIR "$GTK3_DIR-back"
    cp -r $GTK3 ~/.config/
fi


# gtk 4 dir, backup and copy
GTK4_DIR=~/.config/gtk-4.0
if [ -d $GTK4_DIR ]; then
    mv $GTK4_DIR "$GTK4_DIR-back"
    cp -r $GTK4 ~/.config/
fi

# installing tokyo night icons.
Download_URL="https://github.com/ljmill/tokyo-night-icons/releases/latest/download/TokyoNight-SE.tar.bz2"

if [ ! -d '~/.icons/TokyoNight-SE' ]; then
    printf "${action} - Installing Tokyo Night icons.\n"

    # if the tokyo night icon directory was not downloaded, it will download if first
    if [ ! -d 'TokyoNight-SE.tar.bz2' ]; then
        for ((attempt=1; attempt<=2; attempt++)); do
            curl -OL $Download_URL 2>&1 | tee -a "$log" && break
            printf "Tried $attempt time, trying again..\n" 2>&1 | tee -a "$log"
            sleep 2
        done
    fi

    # extracting the icon
    tar -xf TokyoNight-SE.tar.bz2 -C ~/.icons/ 2>&1 | tee -a "$log"
    tar -xf "$ICON" -C ~/.icons/ 2>&1 | tee -a "$log"

    if [ -d ~/.icons/TokyoNight-SE ]; then
        printf "${done} - Successfully Installed Tokyo Night icons \n"
        printf "[ DONE ] - Successfully Installed Tokyo Night icons \n" 2>&1 | tee -a "$log" &>> /dev/null
    else
        printf "${error} - Could not install Tokyo Night icons.\n"
        printf "[ ERROR ] - Could not install Tokyo Night icons.\n" 2>&1 | tee -a "$log" &>> /dev/null
    fi
fi

# installing the cursor
tar -xf "$cursor" -C ~/.icons/

clear

# setting environment variable for qt themes
env_file=/etc/environment
sudo sh -c "echo \"QT_QPA_PLATFORMTHEME='qt5ct'\" >> $env_file" 2>&1 | tee -a "$log"

# extracting themes to ~/.themes/
printf "${action} - Copying themes\n" && sleep 1
tar -xf "$THEME" -C ~/.themes/

printf "${done} - Themes copied successfully...\n"
printf "[ DONE ] - Themes copied successfully.\n" 2>&1 | tee -a "$log" &>> /dev/null

sleep 1

# setting default themes, icon and cursor
gsettings set org.gnome.desktop.interface gtk-theme "theme"
gsettings set org.gnome.desktop.interface icon-theme "TokyoNight-SE"
gsettings set org.gnome.desktop.interface cursor-theme 'Nordzy-cursors'

clear


