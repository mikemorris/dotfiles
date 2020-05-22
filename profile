# Set PKG_CONFIG_PATH
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

# Use Homebrew Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Use global Node.js modules
export PATH="/usr/local/lib/node_modules:$PATH"

# Use Go binaries
export PATH="$HOME/go/bin:$PATH"

# Use Rust Cargo crates
export PATH="$HOME/.cargo/bin:$PATH"

# Use Homebrew LLVM and clang for native WASM compilation
export PATH="/usr/local/opt/llvm/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# Use Homebrew curl to work around SIP for Proxychains
# https://github.com/rofl0r/proxychains-ng/issues/78
export PATH="/usr/local/opt/curl/bin:$PATH"

# Android Studio config
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Add SSH Keys
ssh-add -A &> /dev/null
# TODO: use https://github.com/FiloSottile/yubikey-agent

alias t="tmux -2 at -t"
alias gti="git"

# Load fzf keyy bindings and fuzzy completion
# https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# use .localrc for settings specific to one system
[ -f $HOME/.localrc ] && source $HOME/.localrc
