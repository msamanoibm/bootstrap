#!/bin/bash
sudo -u ubuntu cp -v -a ubuntu/.bashrc /home/ubuntu/
cp -v -a root/.bashrc /root/

sudo -u ubuntu cp -v -a bash/.inputrc /home/ubuntu/
cp -v -a bash/.inputrc /root/

sudo -u ubuntu cp -v -a bash/.bash/ /home/ubuntu/
cp -v -a bash/.bash/ /root/

apt -yqq update
apt -yqq upgrade
apt -yqq install docker.io vim groovy openjdk-8-jdk curl unzip telnet
cd /home/ubuntu
curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod 755 /usr/local/bin/docker-compose
usermod -aG docker ubuntu
sudo -u ubuntu curl -O http://public.dhe.ibm.com/software/products/UrbanCode/Velocity/latest/velocity-se-ibm-install-latest-linux
chmod 755 velocity-se-ibm-install-latest-linux
sudo -u ubuntu mkdir velocity
ufw deny 443

docker pull bitnami/nginx:latest
docker pull mongo:latest
docker pull urbancode/velocity-se-reporting-ui:latest
docker pull urbancode/velocity-se-reporting-consumer:latest
docker pull urbancode/velocity-se-continuous-release-consumer:latest
docker pull urbancode/velocity-se-reporting-sync-api:latest
docker pull urbancode/velocity-se-application-api:latest
docker pull urbancode/velocity-se-release-events-ui:latest
docker pull urbancode/velocity-se-release-events-api:latest
docker pull urbancode/velocity-se-security-api:latest
docker pull urbancode/velocity-se-continuous-release-ui:latest
docker pull bitnami/rabbitmq:latest
docker pull urbancode/velocity-se-multi-app-pipeline-api:latest
docker pull urbancode/velocity-se-continuous-release-poller:latest
docker pull urbancode/velocity-se-rcl-web-client:latest
