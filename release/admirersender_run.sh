# !/bin/sh
#
# Copyright (C) 2015 The QpidNetwork
# AdmirerSender run shell
#
# Created on: 2015/10/10
# Author: Max.Chiu
# Email: Kingsleyyau@gmail.com
#

ADMIRERSENDER_PATH="/home/samson1222/AdmirerSender"
ADMIRERSENDER_LOG_PATH="/home/samson1222/AdmirerSender/log"

ADMIRERSENDER_APP="admirersender"
PROCESS_CMD="${ADMIRERSENDER_PATH}/${ADMIRERSENDER_APP} -f ${ADMIRERSENDER_PATH}/admirersender.config"
PID=`ps -ef|grep admirersender|grep -v grep`
if [ -z "$PID" ];then
  #pkill -9 ${ADMIRERSENDER_APP}
#  echo "[" `date` "] Restart AdmirerSender Server." >> ${ADMIRERSENDER_LOG_PATH}/shut.log
  `${PROCESS_CMD}`
#  echo ${PROCESS}
fi
