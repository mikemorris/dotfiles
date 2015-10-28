# Give locally installed packages precedence over system defaults.
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/lib/node_modules:$PATH"

# Set PKG_CONFIG_PATH
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig:/usr/local/lib/pkgconfig"

# Add SSH Keys
ssh-add $(find $HOME/.ssh/ | egrep _\(rsa\|dsa\)$) &> /dev/null

# Add local Python install to PYTHONPATH
# export PYTHONPATH="/usr/local/lib/python:$PYTHONPATH"

# Fix to install Perl DBD::mysql module and Ruby mysql2 gem
# export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:/usr/local/mysql/lib/"

# Load RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Load NVM into a shell session.
[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM

alias t="tmux -2 at -t"
alias gti="git"
alias gi="git"
alias git-amend="git commit --amend -C HEAD"

# alias git to hub
eval "$(hub alias -s)"

# awscli autocompletion
complete -C aws_completer aws

# bash prompt config
function parse_git_branch { 
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/' 
} 
export PS1="\[\e[33;1m\]\t\[\e[0m\] \u:\w \[\e[31;1m\]\$(parse_git_branch)\[\e[0m\]"

# added by travis gem
[ -f /Users/mikemorris/.travis/travis.sh ] && source /Users/mikemorris/.travis/travis.sh

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi
