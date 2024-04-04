#!/usr/bin/env bash

docker stop ansible01 ansible02 ansible03
docker rm ansible01 ansible02 ansible03

docker run --hostname ansible01 -d -p 2021:22 --name ansible01 ubuntu_ssh
docker run --hostname ansible02 -d -p 2022:22 --name ansible02 ubuntu_ssh
docker run --hostname ansible03 -d -p 2023:22 --name ansible03 ubuntu_ssh

docker ps | grep ansible


ansible ansible01 -i inventory -m ping
ansible ansible02 -i inventory -m ping
ansible ansible03 -i inventory -m ping
