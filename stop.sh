#!/usr/bin/env bash

# Gracefully stop GitLab

set -eux

# 先停 sidekiq，sidekiq 在其他服务之后退出会超时
docker compose exec gitlab gitlab-ctl stop sidekiq
docker compose exec gitlab gitlab-ctl stop
docker compose stop gitlab
