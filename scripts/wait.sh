#!/bin/bash
set -euo pipefail

READY=0
PORT="${1}"
SLEEP="${2}"
ATTEMPTS="${3}"

for (( ATTEMPT=1; ATTEMPT<=$ATTEMPTS; ATTEMPT++ )); do
  echo "connection attempt $ATTEMPT/$ATTEMPTS"

  READY=$(bash -c 'exec 3<> /dev/tcp/127.0.0.1/'"${PORT}"';echo $?' 2>/dev/null)

  if [[ $READY -eq 0 ]]; then
    echo "connection ready"
    break
  fi

  echo "connection not available, sleeping for ${SLEEP} seconds. Recent container logs:"
  docker logs --timestamps --since=${SLEEP}s cloud-sql-proxy

  sleep "${SLEEP}"
done
