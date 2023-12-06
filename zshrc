# No Kill No Beep Beep
unsetopt beep

# Enable zsh completions
autoload -Uz compinit
compinit

# Use Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

# Use Rust Cargo crates
. "$HOME/.cargo/env"

# Use Go binaries
export PATH="$HOME/go/bin:$PATH"

export EDITOR='nvim'

alias t="tmux -2 at -t"
alias gti="git"
alias k="kubectl"

# Load fzf keyy bindings and fuzzy completion
# https://github.com/junegunn/fzf#using-homebrew
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# eval "$(starship init zsh)"

# Load the kubectl completion code for zsh[1] into the current shell
# source <(kubectl completion zsh)

# Use .localrc for settings specific to one system
[ -f $HOME/.localrc ] && source $HOME/.localrc
