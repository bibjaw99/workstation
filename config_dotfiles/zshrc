# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

autoload -Uz compinit
compinit

source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
source <(fzf --zsh)

source "$HOME/.alias"

# vi mode
bindkey -v
export KEYTIMEOUT=1

# language and unicode
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export GROFF_NO_SGR=1
# Editor
export EDITOR=nvim
export VISUAL=nvim
export TERM=xterm-256color

## Editing command line in vim
autoload -z edit-command-line
zle -N edit-command-line
bindkey -M  vicmd v edit-command-line

# Keybindings
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

export PATH="$HOME/.local/bin:$PATH"

eval "$(starship init zsh)"

