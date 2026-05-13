#!/bin/bash
set -e

# Keep the bundled Hermes install synced with upstream main on boot.
# This closes the gap when the Docker Hub `latest` image lags behind git.
if [[ "${HERMES_AUTO_UPDATE:-1}" == "1" || "${HERMES_AUTO_UPDATE:-1}" == "true" || "${HERMES_AUTO_UPDATE:-1}" == "yes" ]]; then
	echo "[startup] Checking Hermes updates..."
	if hermes update --check >/dev/null 2>&1; then
		echo "[startup] Hermes is already up to date."
	else
		echo "[startup] Updating Hermes to latest upstream..."
		if hermes update --yes; then
			echo "[startup] Hermes update complete."
		else
			echo "[startup] Warning: Hermes update failed; continuing with bundled version."
		fi
	fi
fi

hermes gateway run &

exec hermes dashboard --insecure --host 0.0.0.0 --port "${PORT:-9119}"
