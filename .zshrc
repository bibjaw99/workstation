# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/habib350/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Sourcing Plugins from (~/.config/zsh/)
source ~/.config/zsh/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

###################################
#    Exporting Paths
###################################
export PATH="$HOME/.local/bin:$PATH"

###################################
#     Aliases
###################################

## Universal
alias iconfig="nvim ~/.config/i3/config"
alias polyconfig="nvim ~/.config/polybar/config.ini"
alias piconfig="nvim ~/.config/picom/picom.conf"
alias alconfig="nvim ~/.config/alacritty/alacritty.yml"
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
alias ls="ls -la"
## Arch
alias up="yay -Syyu"
alias ref="yay -Syy"
alias search="yay -Ss"
alias pacs="yay -Q | wc -l"
alias list="yay -Q"
alias aur_list="yay -Qm"
# Starship prompt
eval "$(starship init zsh)"

