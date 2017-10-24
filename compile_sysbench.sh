#!/bin/bash

cd /root/sysbench
git pull --all
git checkout ${GIT_CHECKOUT:-master}
./autogen.sh
./configure --without-mysql --with-pgsql
make
make install

cd ..

./intro_message.sh

