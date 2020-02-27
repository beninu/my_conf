#!/bin/bash
#

# backup $.vimrc
VIMRC=${HOME}/.vimrc
VIM=${HOME}/.vim
NOW=$(date +%Y.%m%d.%H%M)

if [ -f ${VIMRC} ];
then
  mv  ${VIMRC} ${VIMRC}.${NOW}
fi

if [ -d ${VIM} ];
then
  mv  ${VIM} ${VIM}.${NOW}
fi

curl -o ${VIMRC} https://raw.githubusercontent.com/beninu/my_conf/master/vim/vimrc

mkdir -p ${VIM}/ww
mkdir -p ${VIM}/autoload


function fetch_vim_file() {
  local vim_file=$1
  curl -o ${VIM}/${vim_file} https://raw.githubusercontent.com/beninu/my_conf/master/vim/vim/${vim_file}
}

fetch_vim_file autoload/plug.vim
#curl -o ${VIM}/autoload/plug.vim https://raw.githubusercontent.com/beninu/my_conf/master/vim/vim/autoload/plug.vim


fetch_vim_file ww/meta.vim
fetch_vim_file ww/c.vim
fetch_vim_file ww/py.vim
fetch_vim_file ww/sh.vim
fetch_vim_file ww/log.vim
fetch_vim_file ww/java.vim

