#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
###################################
#     Aliases
###################################

## Universal
alias iconfig="nvim ~/.config/i3/config"
alias polyconfig="nvim ~/.config/polybar/config.ini"
alias piconfig="nvim ~/.config/picom/picom.conf"
alias alconfig="nvim ~/.config/alacritty/alacritty.yml"
alias kitconfig="nvim ~/.config/kitty/kitty.conf"
alias vim="nvim"
alias ff="neofetch"
alias cc="musikcube"
alias vv="cava"
alias ss="htop"
alias anaconda="source ~/anaconda3/bin/activate && anaconda-navigator"
alias luadir="cd ~/Documents/Lua/Lua_Basics/"
alias neodir="cd ~/.config/nvim"
alias DS="cd ~/Desktop/DS"
alias bsource="source .bashrc"
alias xx="exit"
alias cc="clear"
alias ai="tgpt"

## Arch
alias up="yay -Syyu"
alias ref="yay -Syy"
alias search="yay -Ss"
alias pacs="yay -Q | wc -l"
alias list="yay -Q"
alias aur_list="yay -Qm"

## Fedora
#alias list="dnf list installed"
#alias up="sudo dnf update"
#alias clean="sudo dnf clean all"
#alias bistory="cat .bash_history"

###################################
#         Tmux
###################################
alias tnewS="tmux new -s"
alias tls="tmux ls"
alias trename="tmux rename-session -t"
alias tA="tmux a -t"

###################################
#       Tweaks and Designs
###################################
# Startship prompt
eval "$(starship init bash)"
