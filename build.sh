#!/bin/bash

TAG=$1

GIT_CHECKOUT=${TAG:-master}

docker build . --build-arg GIT_CHECKOUT=${GIT_CHECKOUT} --tag dbpercona/postgres_sysbench:${TAG:-latest}
