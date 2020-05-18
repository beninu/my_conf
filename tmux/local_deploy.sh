#!/bin/bash

set -x 


TMUX_CONF=${HOME}/.tmux.conf
NOW=$(date +%Y.%m%d.%H%M)

# backup
if [ -f ${TMUX_CONF} ];
then
  mv  ${TMUX_CONF} ${TMUX_CONF}.${NOW}
fi



TMUX_VERSION=$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")

REPO_TMUX_CONF=${PWD}/tmux.conf.ge29



ln -sf ${REPO_TMUX_CONF} ${TMUX_CONF}
ln -sf ${PWD}/tmux.32 ${HOME}/bin/tmux

