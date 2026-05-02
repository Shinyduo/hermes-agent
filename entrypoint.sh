#!/bin/bash
set -e

export HERMES_HOME=/opt/data

mkdir -p "$HERMES_HOME"/{cron,sessions,logs,hooks,memories,skills,skins,plans,workspace,home}

if [ ! -f "$HERMES_HOME/.env" ] && [ -f /opt/hermes/.env.example ]; then
    cp /opt/hermes/.env.example "$HERMES_HOME/.env"
fi

if [ ! -f "$HERMES_HOME/config.yaml" ] && [ -f /opt/hermes/cli-config.yaml.example ]; then
    cp /opt/hermes/cli-config.yaml.example "$HERMES_HOME/config.yaml"
fi

/opt/hermes/docker/entrypoint.sh gateway run &

exec /opt/hermes/docker/entrypoint.sh dashboard --host 0.0.0.0 --port "${PORT:-9119}"
