#!/bin/bash

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
log="Install-Logs/nwg-look.log"

# install script dir
ScrDir=`dirname "$(realpath "$0")"`
source $ScrDir/1-global.sh

# packages to install nwg-look
nwg_look=(
golang
gtk3
gtk3-devel
cairo-devel
glib-devel
)

# Installing NWG-Look Dependencies
for PKG1 in "${nwg_look[@]}"; do
  install_package "$PKG1" "$log"
done

printf "${note} Installing nwg-look\n"
# Check if nwg-look directory exists

    if [ -f '/usr/bin/nwg-look' ]; then
        printf "${done} - nwg-look is already installed..\n"
        printf "[ DONE ] - nwg-look is already installed..\n"  2>&1 | tee -a "$log" &>> /dev/null

    elif [ -d "nwg-look" ]; then
        printf "${attention} nwg-look directory already exists. Updating...\n"
        cd nwg-look || exit 1
        git stash
        git pull

    else
        # Clone nwg-look repository if directory doesn't exist
        if git clone https://github.com/nwg-piotr/nwg-look.git; then
            cd nwg-look

            # Build nwg-look
            make build
            if sudo make install 2>&1 | tee -a "$log"; then
            printf "${done} nwg-look installed successfully.\n" 
            printf "[ DONE ] nwg-look installed successfully.\n" 2>&1 | tee -a "$log" &>> /dev/null
            else
            echo -e "${error} Installation failed for nwg-look"
            echo -e "[ ERROR ] Installation failed for nwg-look" 2>&1 | tee -a "$log" &>> /dev/null
            fi
        else
            echo -e "${error} Download failed for nwg-look."
            echo -e "[ ERROR ] Download failed for nwg-look." 2>&1 | tee -a "$log" &>> /dev/null
            exit 1
        fi
    fi

clear