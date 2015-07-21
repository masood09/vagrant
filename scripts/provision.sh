#!/bin/bash

echo ">>>> Configuring Swap space"
fallocate -l 1G /swapfile
chmod 600 /swapfile
mkswap /swapfile &> /dev/null || exit 1
swapon /swapfile &> /dev/null || exit 1
echo "/swapfile   none    swap    sw    0   0" >> /etc/fstab
sysctl vm.swappiness=10 &> /dev/null || exit 1
echo "vm.swappiness=10" >> /etc/sysctl.conf
sysctl vm.vfs_cache_pressure=50 &> /dev/null || exit 1
echo "vm.vfs_cache_pressure = 50" >> /etc/sysctl.conf

echo ">>>> Setting Timezone (UTC)"
ln -sf /usr/share/zoneinfo/UTC /etc/localtime

echo ">>>> Generating the locales"
locale-gen en_US.UTF-8 &> /dev/null || exit 1
export LANG=en_US.UTF-8

echo ">>>> Installing Docker"
curl -sSL https://get.docker.io/ | sh &> /dev/null || exit 1

echo ">>>> Adding user vagrant to Docker group"
usermod -aG docker vagrant

echo ">>>> Install Grunt and Sass"
apt-get install -y --force-yes -qq npm python-software-properties g++ make ruby ruby-dev &> /dev/null || exit 1
ln -s /usr/bin/nodejs /usr/bin/node
gem install --no-ri --no-rdoc sass &> /dev/null || exit 1
npm install -g bower &> /dev/null || exit 1
npm install -g gulp &> /dev/null || exit 1

echo ">>>> Installing nsenter Docker Image"
docker run --rm -v /usr/local/bin:/target jpetazzo/nsenter &> /dev/null || exit 1

echo ">>>> Cleaning Up"
apt-get -qq clean &> /dev/null || exit 1
apt-get -qq autoclean &> /dev/null || exit 1
apt-get -qq autoremove &> /dev/null || exit 1
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
