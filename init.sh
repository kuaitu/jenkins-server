#!/bin/bash

starting(){
  echo "===================== 创建持久化文件夹 =================================="
  mkdir -p ./data/{jenkins,sonarqube}
  echo "======================= 启动应用 ======================================="
  docker-compose -f docker-compose.yml up -d
}

stopping(){
  echo "===================== 关闭应用，清理缓存 ================================="
  docker-compose -f docker-compose.yml down
}

printHelp(){
  echo "开启： ./init.sh up"
  echo "关闭： ./init.sh down"
}


if [ "$1" == "up" ]; then
  starting
elif [ "$1" == "down" ]; then
  stopping
else
  printHelp
  exit 1
fi