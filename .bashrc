############################################################################
# .bashrc
#

#---------------------------------------------------------------------------
# Source Global RC
#---------------------------------------------------------------------------

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

#---------------------------------------------------------------------------
# Display Setup
#---------------------------------------------------------------------------

function get_xserver () {
  case $TERM in
    xterm )
      XSERVER=$(who am i | awk '{print $NF}' | tr -d ')''(' ) 
      # Ane-Pieter Wieringa suggests the following alternative:
      # I_AM=$(who am i)
      # SERVER=${I_AM#*(}
      # SERVER=${SERVER%*)}
      XSERVER=${XSERVER%%:*}
      ;;
    aterm | rxvt)
      # find some code that works here.....
      ;;
  esac  
}

if [ -z ${DISPLAY:=""} ]; then
  get_xserver
  if [[ -z ${XSERVER} || ${XSERVER} == $(hostname) || ${XSERVER} == "unix" ]]; then
    DISPLAY=":0.0"      # Display on local host
  else        
    DISPLAY=${XSERVER}:0.0  # Display on remote host
  fi
fi

export DISPLAY

#---------------------------------------------------------------------------
# General Settings and Environment
#---------------------------------------------------------------------------
export HISTFILESIZE=3000      # we are saving 3000 commands
export HISTCONTROL=ignoredups # don't duplicate lines in history
export HISTCONTROL=ignoreboth # ignore successive entries
shopt -s checkwinsize         # update the values of LINES and COLUMNS if necessary

export TZ=PST8PDT
export LC_COLLATE=C           # I like my underscores sorted to the top.

if [ `uname` == 'NetBSD' ]; then
  export MAIL=/mail/${LOGNAME:?}
  export VISUAL=/usr/pkg/bin/vim
  export EDITOR=/usr/pkg/bin/vim
  export TERM=xterm-color
  export TMPDIR="/tmp"
fi



#---------------------------------------------------------------------------
# Colors
#---------------------------------------------------------------------------
BOLD='';
RESET='\e[0m';
NC='\e[0m';

BLACK='\e[1;30m';
BROWN='\e[0;33m';
BLUE='\e[1;34m';
CYAN='\e[1;36m';
GREEN='\e[1;32m';
ORANGE='\e[1;33m';
PURPLE='\e[1;35m';
VIOLET='\e[1;35m';
RED='\e[1;31m';
WHITE='\e[1;37m';
YELLOW='\e[1;33m';

LIGHTGRAY='\e[0;37m';
DARKGRAY='\e[1;30m';
LIGHTBLUE='\e[1;34m';
LIGHTGREEN='\e[1;32m';
LIGHTCYAN='\e[1;36m';
LIGHTRED='\e[1;31m';
LIGHTPURPLE='\e[1;35m';

#---------------------------------------------------------------------------
# Prompt and Title
#---------------------------------------------------------------------------

case "$TERM" in
  xterm*|rxvt*|screen*|tmux*|cygwin)
    source ~/.git-completion.bash
    source ~/.git-prompt.sh
    export PS1="\[$GREEN\]\t\[$RED\] \[$BLUE\]\u@\h:\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\n\$ "
    ;;
  *)
    export PS1="\u@\h:\w\\n$ "
    ;;
esac

#---------------------------------------------------------------------------
# Aliases
#---------------------------------------------------------------------------

alias vi='vim'

if [ `uname` == 'Darwin' ]; then
  alias ll='ls -l'
  alias la='ls -a'
  alias lla='ls -la'
else
  alias ll='ls -l --time-style=long-iso'
  alias la='ls -a --time-style=long-iso'
  alias lla='ls -la --time-style=long-iso'
fi
alias clean='rm *~ .*~'
alias cleanr='rm $(find . | grep ~$)'
alias sclean='sudo rm *~ .*~'
alias gitgraph='git log --oneline --abbrev-commit --all --graph --decorate --color'
alias gitresetauthor='git commit --amend --reset-author'
alias gitslog='git log --pretty=oneline --abbrev-commit'
alias gfa='for remote in $(git remote | xargs); do git fetch $remote --prune; done'
alias pwhash="python -c \"import crypt,random,string; print crypt.crypt(raw_input('clear-text password: '), '\\\$6\\\$' + ''.join([random.choice(string.ascii_letters + string.digits) for _ in range(16)]))\""

alias curlr10k="curl --silent --output /dev/null -d '{ \"ref\": \"\" }' 'http://puppet:8088/payload'"


if [ `uname` == 'NetBSD' ]; then
  alias ls='colorls -G'
  #alias pine='pine -d 0'
  alias pine='alpine'
fi

# check dircolors -p for coloring values
if [ `uname` == 'Linux' ] || [ `uname` == 'CYGWIN_NT-5.1' ]; then
  eval "`dircolors -b`"
  eval "`dircolors -b ~/.dircolors`"
  alias ls='ls --color=auto --time-style=long-iso'
  alias dir='ls --color=auto --format=vertical'
  alias vdir='ls --color=auto --format=long'
fi

#---------------------------------------------------------------------------
# Functions
#---------------------------------------------------------------------------
if [ -f ~/.bash_functions ]; then
  . ~/.bash_functions
fi

#---------------------------------------------------------------------------
# Programmable Completion
#---------------------------------------------------------------------------
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

#---------------------------------------------------------------------------
# Path Adjustments
#---------------------------------------------------------------------------

if [ -d ${HOME}/homebrew/bin ]; then
  PATH="${HOME}/homebrew/bin:${PATH}"
fi

if [ -f ${HOME}/miniconda3/etc/profile.d/conda.sh ]; then
  . ${HOME}/miniconda3/etc/profile.d/conda.sh
fi

if [ -d /opt/local/bin ]; then
  PATH="/opt/local/bin:$PATH"
fi

if [ -d /usr/local/bin ]; then
  PATH="/usr/local/bin:$PATH"
fi

if [ -d /opt/git/default/bin ]; then
  PATH="/opt/git/default/bin:$PATH"
fi

if [ -d /opt/python/default/bin ]; then
  PATH="/opt/python/default/bin:$PATH"
fi

if [ -d /opt/java/default/bin ]; then
  PATH="/opt/java/default/bin:$PATH"
fi

if [ -d /usr/local/heroku/bin ]; then
  PATH="/usr/local/heroku/bin:$PATH"
fi

if [ -d $HOME/bin ]; then
  PATH="$HOME/bin:$PATH"
fi

export PATH="~/dotfiles/scripts:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
if [ -d $HOME/.rvm/bin ]; then
  export PATH="$PATH:$HOME/.rvm/bin"
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#---------------------------------------------------------------------------
# Load a local bashrc if it exists 
#---------------------------------------------------------------------------

if [ -f ~/.bashrc_local ]; then
  . ~/.bashrc_local
fi

