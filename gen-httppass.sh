#!/bin/bash

read -p "Enter username: " uname
read -s -p "Enter password: " passwd

[[ ! -d ./basic-auth ]] && mkdir ./basic-auth

for svc in service1 service2; do
  htpasswd -b -c ./basic-auth/$svc.local $uname $passwd
done
