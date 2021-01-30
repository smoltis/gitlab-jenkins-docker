#!/usr/bin/env bash
export GITLAB_HOME=$HOME/gitlab

echo "Gitlab repository location: $GITLAB_HOME"
echo "Gitlab and Jenkins will start in daemon mode"
mkdir -p $GITLAB_HOME/gitlab-runner

docker-compose up -d