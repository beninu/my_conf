#!/bin/bash

set -x

VIMRC=${HOME}/.vimrc
VIM=${HOME}/.vim
NOW=$(date +%Y.%m%d.%H%M)

# backup
if [ -f ${VIMRC} ];
then
  mv  ${VIMRC} ${VIMRC}.${NOW}
fi

if [ -d ${VIM} ];
then
  mv  ${VIM} ${VIM}.${NOW}
fi

ln -sf ${PWD}/vim  ${VIM}
ln -sf ${PWD}/vimrc  ${VIMRC}

