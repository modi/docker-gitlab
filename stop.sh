#!/usr/bin/env bash

# Gracefully stop GitLab

set -eux

docker compose exec gitlab gitlab-ctl stop
docker compose stop gitlab
