#!/bin/bash
cp -a ubuntu/.bashrc ~/
sudo cp -a bash/.bashrc /root/

cp -a bash/.inputrc ~/
sudo cp -a bash/.inputrc /root/

cp -a bash/.bash/ ~
sudo cp -a bash/.bash/ /root/

sudo apt -yqq update
sudo apt -yqq upgrade
sudo apt -yqq install docker.io vim groovy openjdk-8-jdk curl unzip ping telnet
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
curl -O http://public.dhe.ibm.com/software/products/UrbanCode/Velocity/latest/velocity-se-ibm-install-latest-linux
chmod 755 velocity-se-ibm-install-latest-linux
