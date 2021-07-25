# Set PKG_CONFIG_PATH
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

# Use Homebrew Ruby
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths

# Use Homebrew Python 3
set -g fish_user_paths "/usr/local/opt/python3/libexec/bin" $fish_user_paths

# Use global Node.js modules
set -g fish_user_paths "/usr/local/lib/node_modules" $fish_user_paths

# Use Rust Cargo crates
set -g fish_user_paths "$HOME/.cargo/bin" $fish_user_paths

# Use Homebrew sbin executables
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

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
