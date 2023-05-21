#!/usr/bin/env bash

ln -sfn "$(brew --prefix)/opt/docker-buildx/bin/docker-buildx" "${XDG_CONFIG_HOME}/docker/cli-plugins/docker-buildx"
ln -sfn "$(brew --prefix)/opt/docker-buildx/bin/docker-compose" "${XDG_CONFIG_HOME}/docker/cli-plugins/docker-compose"
