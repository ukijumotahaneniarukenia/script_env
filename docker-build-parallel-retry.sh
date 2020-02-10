#!/bin/bash

RETRY_ROUND="$@"
ls -l ~/script-env | grep -P '^d' | awk '{print $9}' | grep -v docker-build-log | grep -vE $(docker images | tail -n+1 | grep -P '(-[0-9]{1,}){2,}-' | awk '{print $1}'|xargs|tr ' ' '|') | \
  xargs -P0 -I@ bash -c "echo 'cd ~/script-env/@ && ( time docker build -t @ . ) 1>~/script-env/@/retry-$RETRY_ROUND-log 2>&1 &' " | sh
