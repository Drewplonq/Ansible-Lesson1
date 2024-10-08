#!/bin/bash

docker run -d --name ubuntu pycontribs/ubuntu sleep 6000000
docker run -d --name centos7 pycontribs/centos:7 sleep 6000000
docker run -d --name fedora pycontribs/fedora sleep 6000000

ansible-playbook -i inventory/prod.yml site.yml

docker stop $(docker ps -q)
docker rm $(docker ps -aq)