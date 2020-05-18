# Because ~/.profile isn't invoked if this files exists,
# we must source ~/.profile to get its settings:
if [ -r ~/.profile ]; then . ~/.profile; fi

# The following sources ~/.bashrc in the interactive login case,
# because .bashrc isn't sourced for interactive login shells:
case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac
