#!/bin/bash
dockerID=$(docker ps -q)
PID=$(docker inspect --format '{{.State.Pid}}' $dockerID)
nsenter --target $PID --mount --uts --ipc --net --pid
