
#---------------------------------------------------------------------------
# Source global definitions
#---------------------------------------------------------------------------
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

#---------------------------------------------------------------------------
# Setup Display
#---------------------------------------------------------------------------
function get_xserver ()
{
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
    if [[ -z ${XSERVER}  || ${XSERVER} == $(hostname) ||
          ${XSERVER} == "unix" ]]; then
    DISPLAY=":0.0"      # Display on local host
    else        
    DISPLAY=${XSERVER}:0.0  # Display on remote host
    fi
fi

export DISPLAY

#---------------------------------------------------------------------------
# Settings
#---------------------------------------------------------------------------
export HISTFILESIZE=3000      # we are saving 3000 commands
export HISTCONTROL=ignoredups # don't duplicate lines in history
export HISTCONTROL=ignoreboth # ignore successive entries
shopt -s checkwinsize         # update the values of LINES and COLUMNS if necessary


#---------------------------------------------------------------------------
# Colors
#---------------------------------------------------------------------------
BLACK='\e[0;30m'
BLUE='\e[1;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
YELLOW='\e[1;33m'
WHITE='\e[1;37m'
NC='\e[0m'

#---------------------------------------------------------------------------
# Setup Prompt and Title
#---------------------------------------------------------------------------
case "$TERM" in

xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    #export PS1="${PURPLE}"'[${PWD/$HOME/~}]\n'"${LIGHTGREEN}"'[${USER}@${HOSTNAME}] '"${LIGHTGREEN}"
    #export PS1='\e]2;\u@\H:$(pwd)\a\n\e[0;31m\u\e[0;37m@\e[0;31m\H\e[0;37m:\e[1;34m$(pwd) \e[1;37m\n\$ '
    #export PS1='\n\e[0;31m\u\e[37;0m@\e[0;31m\H\e[0;37m:\e[1;34m$(pwd) \e[1;37m\n\$ '
    #export PS1="${LIGHTGREEN}\u@\h:\w\\n${YELLOW}\$ "
    #export PS1='\e]2;\u@\H:$(pwd)\a\n\e[1;32m\u\e[0;32m@\e[1;32m\H\e[0;32m:\e[1;32m$(pwd) \e[1;33m\n\$ '
    #git bash prompt
    # http://code-worrier.com/blog/git-branch-in-bash-prompt/
    source .git-prompt.sh
    #export PS1='\u@\h:\W$(__git_ps1 " (\[\033[32m\]%s\[\033[m\])")$ '
    export PS1="\[$GREEN\]\t\[$RED\] \[$BLUE\]\u@\h:\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\n\$ "
    ;;

*)
    export PS1="\u@\h:\w\\n$ "
    ;;
esac



#---------------------------------------------------------------------------
# Environment Variables
#---------------------------------------------------------------------------
export TZ=PST8PDT

if [ `uname` == 'NetBSD' ]; then
    export MAIL=/mail/${LOGNAME:?}
    export VISUAL=/usr/pkg/bin/vim
    export EDITOR=/usr/pkg/bin/vim
    export TERM=xterm-color
    export TMPDIR="/tmp"
fi



#---------------------------------------------------------------------------
# Aliases
#---------------------------------------------------------------------------
alias vi='vim'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias clean='rm *~ .*~'
alias sclean='sudo rm *~ .*~'

if [ `uname` == 'NetBSD' ]; then
    alias ls='colorls -G'
    #alias pine='pine -d 0'
    alias pine='alpine'
fi

# check dircolors -p for coloring values
if [ `uname` == 'Linux' ] || [ `uname` == 'CYGWIN_NT-5.1' ]; then
    eval "`dircolors -b`"
    eval "`dircolors -b ~/.dircolors`"
    alias ls='ls --color=auto'
    alias dir='ls --color=auto --format=vertical'
    alias vdir='ls --color=auto --format=long'
fi



#---------------------------------------------------------------------------
# Functions
#---------------------------------------------------------------------------

if [ `uname` == 'Linux' ]; then
    netinfo ()
    {
        echo "--------------- Network Information ---------------"
        /sbin/ifconfig | awk /'inet addr/ {print $2}'
        echo ""
        /sbin/ifconfig | awk /'Bcast/ {print $3}'
        echo ""
        /sbin/ifconfig | awk /'inet addr/ {print $4}'
    
        # /sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
        echo "---------------------------------------------------"
    }
fi


function zdatez () {
  date +"%Y-%m-%d-%H-%M-%S"
}

function gzipr () {
  find . -type f -name "$@" -exec gzip -9 {} \;
}

#---------------------------------------------------------------------------
# Programmable Completion
#---------------------------------------------------------------------------
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

#---------------------------------------------------------------------------
# Path Adjustments
#---------------------------------------------------------------------------

if [ -d /opt/local/bin ]; then
  PATH="/opt/local/bin:$PATH"
fi

if [ -d /usr/local/bin ]; then
  PATH="/usr/local/bin:$PATH"
fi

if [ -d /usr/local/heroku/bin ]; then
  PATH="/usr/local/heroku/bin:$PATH"
fi

if [ -d $HOME/.rvm/bin ]; then
  PATH="$HOME/.rvm/bin:$PATH"
fi

if [ -d $HOME/bin ]; then
  PATH="$HOME/bin:$PATH"
fi

export PATH="$PATH"
