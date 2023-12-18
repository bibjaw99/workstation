# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

###################################
#     Plugins 
###################################
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

###################################
#      exclusive settings
###################################
# vi mode
bindkey -v
export KEYTIMEOUT=1

# Editor
export EDITOR=nvim
export VISUAL=nvim

## Editing command line in vim
autoload -z edit-command-line
zle -N edit-command-line
bindkey -M  vicmd v edit-command-line

# Keybindings
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

###################################
#    Exporting Paths
###################################
export PATH="$HOME/.local/bin:$PATH"

###################################
#     Aliases
###################################

## Universal
alias iconfig="nvim ~/.config/i3/config"
alias qconfig="nvim ~/.config/qtile/config.py"
alias polyconfig="nvim ~/.config/polybar/config.ini"
alias piconfig="nvim ~/.config/picom/picom.conf"
alias alconfig="nvim ~/.config/alacritty/alacritty.yml"
alias kitconfig="nvim ~/.config/kitty/kitty.conf"
alias wezconfig="nvim ~/.config/wezterm/wezterm.lua"
alias ls="eza --icons"
alias la="ls -la"
alias lsTree="ls --tree"
alias vv="nvim"
alias dv="devour"
alias open="devour pcmanfm"
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
alias upArchMirrors="rate-mirrors --allow-root arch | sudo tee /etc/pacman.d/mirrorlist"

###################################
#         Tmux
###################################
alias tnew="tmux new -s"
alias tls="tmux ls"
alias trename="tmux rename-session -t"
alias ta="tmux a -t"

# Starship prompt
eval "$(starship init zsh)"

