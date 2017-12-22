# Give locally installed packages precedence over system defaults.
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/lib/node_modules:$PATH

# Set PKG_CONFIG_PATH
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

# Add SSH Keys
ssh-add -A &> /dev/null

# Use asdf version manager
[ -f $HOME/.asdf/asdf.sh ] && source $HOME/.asdf/asdf.sh
[ -f $HOME/.asdf/completions/asdf.bash ] && source $HOME/.asdf/completions/asdf.bash
export ERLANG_EXTRA_CONFIGURE_OPTIONS="--without-javac"
export ASDF_ERLANG_OPTIONS="--no-docs"

# Android Studio config
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platforms-tools

alias t="tmux -2 at -t"
alias gti="git"

# alias git to hub
eval "$(hub alias -s)"

# awscli autocompletion
complete -C aws_completer aws

# bash prompt config
function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}
export PS1="\[\e[33;1m\]\t\[\e[0m\] \u:\w \[\e[31;1m\]\$(parse_git_branch)\[\e[0m\]"

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# use .localrc for settings specific to one system
[ -f $HOME/.localrc ] && source $HOME/.localrc
