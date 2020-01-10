#!/bin/sh

if [ -z "$1" ]; then
	echo "请在参数中指定进程Id文件的名称！"
	exit 1
fi

CURRENT_DIR=$(pwd)
PROJECT_DIR=$CURRENT_DIR"/.."

# echo $PROJECT_DIR

CLASSPATH=
CLASSPATH=$CLASSPATH:$PROJECT_DIR

CLASSPATH=$CLASSPATH:$CURRENT_DIR"/../lib/*"

# echo $CLASSPATH

APPNAME=com.iflytek.ap.storage.gw.GatewayBootstrap

nohup java -Xms2G -Xmx2G -classpath $CLASSPATH $APPNAME test >/dev/null 2>&1  &

echo $! > "$1.pid"

echo "started"
