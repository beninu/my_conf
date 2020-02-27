#!/bin/bash

set -x 

TMUX_VERSION=$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")

TMUX_CONF=${PWD}/tmux.conf
if [[ $(bc <<< "$TMUX_VERSION >= 2.9") -eq 1 ]];
then
TMUX_CONF=${PWD}/tmux.conf.ge29
fi

TARGET=${HOME}/.tmux.conf




ln -sf  ${TMUX_CONF} ${TARGET}

