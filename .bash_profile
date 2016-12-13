############################################################################
# .bash_profile
#

#---------------------------------------------------------------------------
# Load Aliases and Functions
#---------------------------------------------------------------------------

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

#---------------------------------------------------------------------------
# Update Path and Environment
#---------------------------------------------------------------------------

unset TMOUT
TMOUT=0
export TMOUT

PATH=$PATH:$HOME/bin
export PATH

#---------------------------------------------------------------------------
# SSH Configuration
#---------------------------------------------------------------------------
function launch_ssh_agent () {
  if [ -z "${SSH_AUTH_SOCK}" ] ; then
    eval `ssh-agent -s`
    ssh-add
  fi
}

# Only launch automatically if we are not ssh'ing into a remote host
if [ -z "${SSH_TTY}" ] ; then
  launch_ssh_agent
fi



#---------------------------------------------------------------------------
# RVM
#  - Load RVM into a shell session *as a function*
#---------------------------------------------------------------------------

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#---------------------------------------------------------------------------
# NVM
#---------------------------------------------------------------------------

if [ -d $HOME/.nvm ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
fi
