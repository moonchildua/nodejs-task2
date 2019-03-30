#!/bin/bash
sudo yum install gcc make -y
cd ..
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make
sudo mkdir /etc/redis
sudo mkdir /var/redis
sudo cp utils/redis_init_script /etc/init.d/redis_6379
sudo cp redis.conf /etc/redis/6379.conf
sudo mkdir /var/redis/6379
sudo cp src/redis-cli /usr/local/bin
echo "redis-cli is installed on local machine"
sleep 10s # Waits 10 seconds.

sudo yum install docker -y
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo systemctl start docker

echo "docker application is installed and started"
cd ../nodejs-task2/
sudo docker-compose up

echo "check web app in browser http://yourIP"
echo "to check redis run  redis-cli and then get count"
