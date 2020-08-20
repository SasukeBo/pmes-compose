#!/bin/bash

compose_path="/home/sasukebo/pmes-compose"

case $1 in
"device")
  cd $GOPATH/src/github.com/SasukeBo/pmes-data-center
  git pull origin version2
  cd $compose_path
  docker-compose restart device && docker logs -f --since 30s pmescompose_center_1
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
*)
  echo "Illegal option $1, only support device, front, back"
  ;;
esac
