#!/bin/bash

set -ex

host=$(hostname -i)
port=2375
zk_host=$(getent hosts zookeeper | awk '{ print $1 }' | head -1)
discovery="zk://$zk_host:2181/"

/dind docker daemon -H 0.0.0.0:$port &

sleep 2
DOCKER_HOST=tcp://localhost:$port docker run swarm join --addr=$host:$port $discovery

# TODO: doesn't exit properly on SIGTERM
