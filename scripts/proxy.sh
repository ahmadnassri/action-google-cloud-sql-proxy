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
    --publish "${PORT}:${PORT}" \
    --volume "${DIR}:${DIR}" \
    "${IMAGE}" \
    ${INSTANCE_CONNECTION_NAME} \
    --credentials-file "${DIR}/key.json"
else
  # use token
  docker run \
    --detach \
    --restart on-failure \
    --name cloud-sql-proxy \
    --publish "${PORT}:${PORT}" \
    "${IMAGE}" \
    ${INSTANCE_CONNECTION_NAME} \
    --token "${TOKEN}"
fi
