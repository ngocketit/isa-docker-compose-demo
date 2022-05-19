#!/bin/bash

if [[ ! $(which docker) ]]; then
  echo "You don't have docker installed"
  exit 1
fi

cat <<EOF
NOTE: You need to have a Docker hub account in order to continue. If you don't have it yet, please create one at: https://hub.docker.com/signup
EOF
read -p "Do you have a Dockerhub account? [y/n] " confirm

case $confirm in
  y|Y)
    ;;
  *)
    exit 1
    ;;
esac

read -p "Enter your Dockerhub username: " uname
docker login -u $uname

for svc in service1 service2; do
  docker builder build -t ${uname}/$svc ./$svc
  docker push ${uname}/$svc
done
