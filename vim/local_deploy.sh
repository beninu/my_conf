#!/bin/bash

set -x

VIMRC=${HOME}/.vimrc
VIM=${HOME}/.vim

ln -sf ${PWD}/vim  ${VIM}
ln -sf ${PWD}/vimrc  ${VIMRC}

