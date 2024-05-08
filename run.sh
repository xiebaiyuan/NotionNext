#!/bin/bash

while true; do
    # 检查 Yarn 进程是否存在
    if pgrep -x "npm" > /dev/null; then
        echo "npm process is already running."
    else
        # 执行命令
        nohup npm start >/dev/null 2>&1 &

        # 获取最新启动的进程ID
        pid=$!

        echo "npm process started with PID: $pid"
    fi

    # 等待一段时间后重新执行
    sleep 5
done