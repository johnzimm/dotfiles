############################################################################
# Function Library
#

#---------------------------------------------------------------------------
# zdate
#---------------------------------------------------------------------------
function zdate () {
  date +"%Y-%m-%d-%H-%M-%S"
}

#---------------------------------------------------------------------------
# znotes
#---------------------------------------------------------------------------
function znotes () {
  if [ -f "${HOME}/dotfiles/docs/index.md" ]; then
    echo ""
    cat ${HOME}/dotfiles/docs/*.md | less
    echo ""
  fi
}

#---------------------------------------------------------------------------
# zgzipr
#---------------------------------------------------------------------------
function zgzipr () {
  find . -type f -name "$@" -exec gzip -9 {} \;
}

#---------------------------------------------------------------------------
# znetinfo
#---------------------------------------------------------------------------
function znetinfo () {
  if [ `uname` == 'Linux' ]; then
    echo "--------------- Network Information ---------------"
    /sbin/ifconfig | awk /'inet addr/ {print $2}'
    echo ""
    /sbin/ifconfig | awk /'Bcast/ {print $3}'
    echo ""
    /sbin/ifconfig | awk /'inet addr/ {print $4}'

    # /sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
    echo "---------------------------------------------------"
  fi
}

#---------------------------------------------------------------------------
# znetinfo
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

