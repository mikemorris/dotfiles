# Give locally installed packages precedence over system defaults.
export PATH="/usr/local/bin:$PATH"

# Add local Python install to PYTHONPATH
export PYTHONPATH="/usr/local/lib/python:$PYTHONPATH"

# Load RVM into a shell session.
[[ -s "/Users/mikemorris/.rvm/scripts/rvm" ]] && source "/Users/mikemorris/.rvm/scripts/rvm"

alias pear="php /usr/lib/php/pear/pearcmd.php" 
alias pecl="php /usr/lib/php/pear/peclcmd.php" 
