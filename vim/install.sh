#!/bin/bash
#

# backup $.vimrc
VIMRC=${HOME}/.vimrc
if [ -f ${VIMRC} ];
then
  mv  ${VIMRC} ${VIMRC}.$(date +%s)
fi

curl -o ${VIMRC} https://raw.githubusercontent.com/beninu/my_conf/master/vim/vimrc
