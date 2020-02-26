#!/bin/bash
#

# backup $.vimrc
VIMRC=${HOME}/.vimrc
VIM=${HOME}/.vim
NOW=$(date +%s)
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

curl -o ${VIM}/autoload/plug.vim https://raw.githubusercontent.com/beninu/my_conf/master/vim/vim/autoload/plug.vim


curl -o ${VIM}/ww/c.vim https://raw.githubusercontent.com/beninu/my_conf/master/vim/vim/ww/c.vim
curl -o ${VIM}/ww/py.vim https://raw.githubusercontent.com/beninu/my_conf/master/vim/vim/ww/py.vim
curl -o ${VIM}/ww/sh.vim https://raw.githubusercontent.com/beninu/my_conf/master/vim/vim/ww/sh.vim
curl -o ${VIM}/ww/log.vim https://raw.githubusercontent.com/beninu/my_conf/master/vim/vim/ww/log.vim
curl -o ${VIM}/ww/java.vim https://raw.githubusercontent.com/beninu/my_conf/master/vim/vim/ww/java.vim
