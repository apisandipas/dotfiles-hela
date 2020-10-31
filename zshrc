# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#                   .__
#    ________  _____|  |_________   ____
#    \___   / /  ___/  |  \_  __ \_/ ___\
#     /    /  \___ \|   Y  \  | \/\  \___
# /\ /_____ \/____  >___|  /__|    \___  >
# \/       \/     \/     \/            \/
#

# Environment Variabes
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"  

export HOST_NAME="hela"
export COMPUTER_NAME="hela.local"
export TERM="screen-256color"
export EDITOR=$(which nvim)
export BROWSER=$(which google-chrome)
export BAT_THEME="Nord"
export DOTS_DIR=$HOME/.dotfiles
export VIM_WIKI_DIR=$HOME/vimwiki

# Path Config
export PATH=$PATH:$HOME/.yarn/bin:$HOME/scripts

# Load oh-my-zsh plugins
plugins=(git tmux yarn zsh-z zsh-autosuggestions zsh-syntax-highlighting)

# External scripts
[ -f "$ZSH/oh-my-zsh.sh" ] && source $ZSH/oh-my-zsh.sh
[ -f "~/nvm/nvm.sh" ] && source ~/.nvm/nvm.sh

# Aliases
alias vim="nvim"
alias cat="bat"
alias ls="exa --icons"
alias ll="exa -alh --icons"
alias lt="exa -T --icons --git-ignore"
alias dennis="curl -L http://git.io/unix"
alias dots="cd $DOTS_DIR; vim ; cd -;"  # avoids netrw
alias vimrc="vim $DOTS_DIR/vimrc"
alias zshrc="vim $DOTS_DIR/zshrc"
alias fzf='rg --files --ignore-case --hidden -g "!{.git,node_modules,vendor,.config,.cargo,.cache}" | fzf'
alias fix='vim $(git diff --name-only | uniq)'

# Functions
mkcd() { mkdir -p "$@" && cd $_; }
gi() { echo "fetching $@ gitignore"; curl -sLw "\n" https://www.gitignore.io/api/$@ >> .gitignore;}
killport() { echo "Killing port $1"; sudo kill -9 $(sudo lsof -t -i:$1) }
path() { echo $PATH | tr ":" "\n" | nl; }

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
