###############################################################################
# Function Library
#

#
# zdate
#
function zdate () {
  date +"%Y-%m-%d-%H-%M-%S"
}

#
# zexamples
#
function zexamples () {
  if [ -f ~/.bash_examples.md ]; then
    echo ""
    cat ~/.bash_examples.md
    echo ""
  fi
}

#
# zgzipr
#
function zgzipr () {
  find . -type f -name "$@" -exec gzip -9 {} \;
}

#
# znetinfo
#
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
