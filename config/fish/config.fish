# Set PKG_CONFIG_PATH
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

# Use global Node.js modules
export PATH="/usr/local/lib/node_modules:$PATH"

# Use Rust Cargo crates
export PATH="$HOME/.cargo/bin:$PATH"

# Preferred editor for local and remote sessions
if test -n $SSH_CONNECTION
  export EDITOR='vim'
else
  export EDITOR='nvim'
end

# Add SSH Keys
ssh-add -A &> /dev/null
# TODO: use https://github.com/FiloSottile/yubikey-agent

alias t="tmux -2 at -t"
alias gti="git"
