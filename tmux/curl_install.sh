#!/bin/bash
#

TMUX_CONF=${HOME}/.tmux.conf
NOW=$(date +%Y.%m%d.%H%M)

# backup
if [ -f ${TMUX_CONF} ];
then
  mv  ${TMUX_CONF} ${TMUX_CONF}.${NOW}
fi


TMUX_VERSION=$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")
REMOTE_TMUX_CONF=tmux.conf
if [[ $(bc <<< "$TMUX_VERSION >= 2.9") -eq 1 ]];
then
REMOTE_TMUX_CONF=tmux.conf.ge29
fi


curl -o ${TMUX_CONF} https://raw.githubusercontent.com/beninu/my_conf/master/tmux/${REMOTE_TMUX_CONF}

