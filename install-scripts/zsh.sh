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
done="${cyan}[ DONE ]${end}" #

# Set the name of the log file to include the current date and time
log="Install-Logs/install_zsh.log"

# install script dir
ScrDir=`dirname "$(realpath "$0")"`
source $ScrDir/1-global.sh

zsh=(
zsh 
util-linux
)

# Check if the log file already exists, if yes, append a counter to make it unique
COUNTER=1
while [ -f "$log" ]; do
  log="Install-Logs/install_${COUNTER}_zsh.log"
  ((COUNTER++))
done

# Installing zsh packages
printf "${action} - Installing core zsh packages\n"
for ZSHP in "${zsh[@]}"; do
  install_package "$ZSHP" "$zsh"
done

printf "\n"

# ---- oh-my-zsh installation ---- #
printf "${action} - Now installing ${yellow}' oh-my-zsh, zsh-autosuggestions, zsh-syntax-highlighting, powerlevel10k theme '${end}...\n"
sleep 2

oh_my_zsh_dir="$HOME/.oh-my-zsh"

if [ -d "$oh_my_zsh_dir" ]; then
    printf "${attention} - $oh_my_zsh_dir located, it is necessary to remove or rename it for the installation process. So renaming the directory...\n" 2>&1 | tee -a "$log"
    mv $oh_my_zsh_dir "$oh_my_zsh_dir-back"
fi

 	  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && \

printf "${done} - Installation completed...\n"
printf "[ DONE ] - Installation completed\n" 2>&1 | tee -a "$log" &>> /dev/null

# changing shell
  user_shell=$(echo $SHELL)
  if [[ $user_shell == "/usr/bin/zsh" ]]; then
    printf "${note} - Your shell is already zsh. No need to change it.\n"
    printf "[ NOTE ] - Your shell is already zsh. No need to change it.\n" 2>&1 | tee -a "$log" &>> /dev/null
  else
    printf "${action} - Changing shell to ${cyan}zsh ${end}\n"
    printf "$[ ACTION ] - Changing shell to ZSH.\n" 2>&1 | tee -a "$log" &>> /dev/null
    chsh -s $(which zsh) 2>&1 | tee -a "$log"
  fi
sleep 1

printf "${action} - Now proceeding to the next step, Configuring $HOME/.zshrc file\n"
sleep 2

  if [ -f ~/.zshrc ]; then
    printf "${action} - Backing up the .zshrc to .zshrc.back\n" 2>&1 | tee -a "$log"
        mv ~/.zshrc ~/.zshrc.back
    sleep 1

  fi

  if [ -f ~/.p10k.zsh ]; then
    printf "${action} - Backing up the .p10k.zsh file to .p10k.zsh.back\n" 2>&1 | tee -a "$log"
        mv ~/.p10k.zsh ~/.p10k.zsh.back
  fi

    printf "${done} - Backup done\n" 2>&1 | tee -a "$log"
    printf "[ DONE ] - Backup done (.zshrc and .p10k.zsh file)\n" 2>&1 | tee -a "$log" &>> /dev/null

  sleep 1


zshrc_file='extras/.zshrc'
p10k_file='extras/.p10k.zsh'

printf "${action} - Copying '$zshrc_file' and '$p10k_file' to the '$HOME/' directory\n" 2>&1 | tee -a "$log"
sleep 1

 cp $zshrc_file $p10k_file "$HOME/"

printf "${done} - Installation and configuration of ${cyan}zsh and oh-my-zsh ${end}finished!\n"
printf "${done} - Installation and configuration of zsh and oh-my-zsh finished!\n" 2>&1 | tee -a "$log" &>> /dev/null

printf "${done} - You can always configure the powerlevel10k theme with the ${yellow} p10k configure ${end}command in your termianal.\n"

printf "${done} - You can always configure the powerlevel10k theme with the p10k configure command in your termianal.\n" 2>&1 | tee -a "$log" &>> /dev/null
