#!/bin/bash
# 获取所有 npm start 相关进程的 PID
pids=$(ps aux | grep 'npm start' | grep -v grep | awk '{print $2}')

# 遍历每个 PID 并杀死相关进程
for pid in $pids; do
    echo "Killing process with PID $pid"
    kill -9 $pid
done

echo "All npm start processes have been killed."
