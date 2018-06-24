#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl git \
    software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce -y
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo docker-compose --version
sudo systemctl enable docker

git clone https://github.com/hunterlong/statup.git
cd statup/servers
sudo service docker start
sudo docker-compose up -d