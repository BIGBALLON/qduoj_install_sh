#!/bin/bash


BASE_PATH="/home/"
WEB_PATH="${BASE_PATH}OnlineJudge/dockerfiles/oj_web_server/"
JUDGER_PATH="${BASE_PATH}OnlineJudge/dockerfiles/judger/"


#install other tools git curl python-pip vim nginx docker docker-compose
apt-get update && apt-get install -y git curl python-pip vim nginx
curl -sSL https://get.daocloud.io/docker | sh
pip install docker-compose

#get source from QingdaoU
git clone https://github.com/QingdaoU/OnlineJudge.git /home/OnlineJudge

flag=0
if [ $# -eq 3 ]; then
	MYSQL_PASS=$1
	JUDGER_TOKEN=$2
	flag=1
fi

# edit & copy oj.conf
sed -i "s/xxxxxxx.com/$3/g" oj.conf
cp oj.conf /etc/nginx/conf.d/oj.conf

#create work dir set default conf
mkdir -p /home/data/mysql /home/data/redis /home/test_case /home/log /home/upload


#just pull the images

docker pull registry.aliyuncs.com/v-image/mysql
docker pull registry.aliyuncs.com/v-image/redis
docker pull registry.aliyuncs.com/v-image/oj_web_server
docker pull registry.aliyuncs.com/v-image/judger

docker tag registry.aliyuncs.com/v-image/mysql mysql
docker tag registry.aliyuncs.com/v-image/redis redis
docker tag registry.aliyuncs.com/v-image/oj_web_server qduoj/oj_web_server
docker tag registry.aliyuncs.com/v-image/judger qduoj/judger

## edit mysql password
cd $WEB_PATH 
cp docker-compose.example.yml docker-compose.yml
if [ $flag == 1 ]; then
	sed -i "s/{YOUR_PASSWORD}/$1/g" docker-compose.yml
fi
docker-compose up -d


WEB_CID=`docker ps -a | grep qduoj/oj_web_server | grep -Eo "^[a-z0-9]*"`
JUDGER_CID=`docker ps -a | grep qduoj/judger | grep -Eo "^[a-z0-9]*"`
docker exec -i -t $WEB_CID /bin/bash


## edit judger token
cd $JUDGER_PATH 
cp docker-compose.example.yml docker-compose.yml
if [ $flag == 1 ]; then
	sed -i "s/{YOUR_PASSWORD}/$2/g" docker-compose.yml
fi
docker-compose up -d

service nginx restart