#!/bin/bash

SERVER_DIR="../"
CLIENT_DIR="../"
SERVER_SCRIPT="server.py"
PYTHON_CMD="python3"

start_server() {
    echo "Запуск серверного приложения..."
    cd $SERVER_DIR
    $PYTHON_CMD $SERVER_SCRIPT &
    SERVER_PID=$!
    echo $SERVER_PID > server.pid
    echo "Сервер запущен с PID: $SERVER_PID"
}

stop_server() {
    cd $SERVER_DIR
    if [ -f server.pid ]; then
        SERVER_PID=$(cat server.pid)
        echo "Остановка сервера с PID: $SERVER_PID"
        kill $SERVER_PID
        rm server.pid
        echo "Сервер остановлен."
    else
        echo "Файл server.pid не найден. Сервер, возможно, не запущен."
    fi
}

restart_server() {
    stop_server
    start_server
}

case "$1" in
    start)
        start_server
        ;;
    stop)
        stop_server
        ;;
    restart)
        restart_server
        ;;
    *)
        echo "Использование: $0 {start|stop|restart}"
        exit 1
        ;;
esac