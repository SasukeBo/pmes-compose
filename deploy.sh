#!/bin/bash

compose_path="/home/sasukebo/pmes-compose"

case $1 in
"device")
  cd $GOPATH/src/github.com/SasukeBo/pmes-data-center
  git pull origin version2
  cd $compose_path
  dc restart device
  ;;
"front")
  cd /home/sasukebo/pmes-data-center-vue
  git pull origin version2
  yarn build
  cd $compose_path
  dc restart data_center_vue
  ;;
"back")
  cd $GOPATH/src/github.com/SasukeBo/pmes-data-center
  git pull origin version2
  cd $compose_path
  dc restart data_center_go
  ;;
*)
  echo "Illegal option $1, only support device, front, back"
  ;;
esac
