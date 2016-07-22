# !/bin/sh
#
# Copyright (C) 2015 The QpidNetwork
# AdmirerSender run shell
#
# Created on: 2015-11-24
# Author: Samson
#

ADMIRERSENDER_LOG_PATH="/home/samson1222/AdmirerSender/log"
ADMIRERSENDER_HOST="192.168.8.247:9100"

echo "[" `date` "] AdmirerSender Server clean send list." >> ${ADMIRERSENDER_LOG_PATH}/clean.log
`wget -qO- http://${ADMIRERSENDER_HOST}/CLEARLETTERSENDLIST &> /dev/null`
