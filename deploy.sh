#!/bin/bash

compose_path="/home/sasukebo/pmes-compose"

case $1 in
"device")
  cd $GOPATH/src/github.com/SasukeBo/pmes-data-center
  git pull origin version2
  cd $compose_path
  docker-compose restart device
  ;;
"front")
  cd /home/sasukebo/pmes-data-center-vue
  git pull origin version2
  yarn build
  cd $compose_path
  docker-compose restart front
  ;;
"back")
  cd $GOPATH/src/github.com/SasukeBo/pmes-data-center
  git pull origin version2
  cd $compose_path
  docker-compose restart center
  ;;
"dmb")
  cd $GOPATH/src/github.com/SasukeBo/pmes-device-monitor
  git pull origin master
  cd $compose_path
  docker-compose restart device_monitor_go
  ;;
"dmf")
  cd /home/sasukebo/pmes-device-monitor-vue
  git pull origin master
  yarn build
  cd $compose_path
  docker-compose restart device_monitor_vue
  ;;
*)
  echo "Illegal option $1, only support device, front, back"
  ;;
esac
