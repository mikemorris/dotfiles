autoload -Uz compinit
compinit

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

eval "$(starship init zsh)"

# Load the kubectl completion code for zsh[1] into the current shell
source <(kubectl completion zsh)
