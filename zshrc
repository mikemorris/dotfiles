# Give locally installed packages precedence over system defaults
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Use Homebrew Ruby
export PATH=/usr/local/opt/ruby/bin:$PATH

# Use Homebrew LLVM and clang for native WASM compilation
export PATH="/usr/local/opt/llvm/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# Use Homebrew curl to work around SIP for Proxychains
# https://github.com/rofl0r/proxychains-ng/issues/78
export PATH="/usr/local/opt/curl/bin:$PATH"

# Set PKG_CONFIG_PATH
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

# Add SSH Keys
ssh-add -A &> /dev/null

# Use global Node.js modules
export PATH=/usr/local/lib/node_modules:$PATH

# Use Rust Cargo crates
export PATH=$HOME/.cargo/bin:$PATH

# Use Go binaries
export PATH=$HOME/go/bin:$PATH

# Android Studio config
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

export EDITOR=nvim

alias t="tmux -2 at -t"
alias gti="git"

# alias git to hub
eval "$(hub alias -s)"

# Enable zsh completion
autoload -Uz compinit
compinit

# Load the kubectl completion code for zsh[1] into the current shell
source <(kubectl completion zsh)

# Load fzf keyy bindings and fuzzy completion
# https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bash prompt config
function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}
# export PS1="\[\e[33;1m\]\t\[\e[0m\] \u:\w \[\e[31;1m\]\$(parse_git_branch)\[\e[0m\]"

# use .localrc for settings specific to one system
[ -f $HOME/.localrc ] && source $HOME/.localrc
