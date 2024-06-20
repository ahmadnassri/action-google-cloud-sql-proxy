#!/bin/bash
set -euo pipefail

PORT="${2}"
INSTANCE_CONNECTION_NAME="${3}"
TOKEN="${4:-null}"
DIR="/tmp/action-google-cloud-sql-proxy"
IMAGE="gcr.io/cloud-sql-connectors/cloud-sql-proxy:${1}"

if [ $TOKEN = "null" ]; then
  # use credential file
  docker run \
    --detach \
    --restart on-failure \
    --name cloud-sql-proxy \
    --publish "127.0.0.1:${PORT}:${PORT}" \
    --volume "${DIR}:${DIR}" \
    "${IMAGE}" \
    --address=0.0.0.0 \
    --credentials-file "${DIR}/key.json" \
    ${INSTANCE_CONNECTION_NAME}
else
  # use token
  docker run \
    --detach \
    --restart on-failure \
    --name cloud-sql-proxy \
    --publish "127.0.0.1:${PORT}:${PORT}" \
    "${IMAGE}" \
    --address=0.0.0.0 \
    --token "${TOKEN}" \
    ${INSTANCE_CONNECTION_NAME}
fi
