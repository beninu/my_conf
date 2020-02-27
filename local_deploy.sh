#!/bin/bash
#
#
# Author : author@corp.abc.com
# Created: 2020 Feb 27 Thu 09:14:18 CST

WORKING_DIR=$PWD

cd ${WORKING_DIR}/vim
sh local_deploy.sh

cd ${WORKING_DIR}/tmux
sh local_deploy.sh


