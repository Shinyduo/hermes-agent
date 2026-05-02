#!/bin/bash
set -e

hermes gateway run &

exec hermes dashboard --insecure --host 0.0.0.0 --port "${PORT:-9119}"
