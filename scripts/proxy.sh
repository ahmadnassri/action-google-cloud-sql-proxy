#!/bin/bash
set -euo pipefail

PORT="${2}"
CONNECTION="${3}"
DIR="/tmp/action-google-cloud-sql-proxy"
IMAGE="gcr.io/cloudsql-docker/gce-proxy:${1}"

# start container
docker run \
  --detach \
  --net host \
  --restart on-failure \
  --name cloud-sql-proxy \
  --publish "${PORT}:${PORT}" \
  --volume "${DIR}:${DIR}" \
  "${IMAGE}" \
  /cloud_sql_proxy \
  -dir "${DIR}" \
  -credential_file "${DIR}/key.json" \
  -instances="${CONNECTION}=tcp:${PORT}"
