# Show the runtime
function preexec() {
  timer=${timer:-$SECONDS}
}

function precmd() {
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    export RPROMPT="%F{cyan}${timer_show}s %{$reset_color%}"
    unset timer
  fi
}

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# case sensetivity
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Set name of the theme to load --- if set to "random", it will
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# just remind me to update when it's time
 zstyle ':omz:update' mode reminder

# Command auto correction
 ENABLE_CORRECTION="true"

# Zsh Plugins
plugins=(
    git
    zsh-autosuggestions
    jsontools
    web-search
    zsh-syntax-highlighting
    )

source $ZSH/oh-my-zsh.sh


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


neofetch
