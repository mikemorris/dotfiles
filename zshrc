# Set vim mode for shell line editor
bindkey -v

# Enable zsh completions
autoload -Uz compinit
compinit

# No Kill No Beep Beep
unsetopt beep

# Use Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

# Use Rust Cargo crates
. "$HOME/.cargo/env"

# Use Go binaries
export PATH="$HOME/go/bin:$PATH"

# Set default editor for git and other utils
export EDITOR='nvim'

alias t="tmux at -t"
alias gti="git"
alias k="kubectl"
alias rg="rg -S -C 2"
alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias cat="bat -A"
alias gdu="gdu-go"

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Load fzf keyy bindings and fuzzy completion
# https://github.com/junegunn/fzf#using-homebrew
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# eval "$(starship init zsh)"

# Load the kubectl completion code for zsh[1] into the current shell
# source <(kubectl completion zsh)

# Use .localrc for settings specific to one system
[ -f $HOME/.localrc ] && source $HOME/.localrc
