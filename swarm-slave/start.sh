#!/bin/bash

set -ex

host=$(hostname -i)
port=2375

# Get the ip address of the discovery service, so it can be passed to the
# swarm slave container
discovery_ip=$(getent hosts $discovery_host | awk '{ print $1 }' | head -1)

# Start docker daemon
/dind docker daemon -H 0.0.0.0:$port &
sleep 2

# Start swarm slave
DOCKER_HOST=tcp://localhost:$port docker run \
    --add-host $discovery_host:$discovery_ip \
    swarm join \
    --addr=$host:$port $discovery

# TODO: doesn't exit properly on SIGTERM
