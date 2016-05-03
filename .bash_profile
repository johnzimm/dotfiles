# .bash_profile


#
# Override TMOUT in subshell
#
unset TMOUT
TMOUT=0
export TMOUT


# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH


#---------------------------------------------------------------------------
# SSH Configuration
#---------------------------------------------------------------------------
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add
fi

#---------------------------------------------------------------------------
# RVM
#---------------------------------------------------------------------------

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


#---------------------------------------------------------------------------
# NVM
#---------------------------------------------------------------------------

if [ -d $HOME/.nvm ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
fi
