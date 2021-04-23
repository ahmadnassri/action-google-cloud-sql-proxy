#!/bin/bash
set -euo pipefail

READY=0
PORT="${2}"
SLEEP="${3}"
ATTEMPTS="${4}"

for ATTEMPT in {1..10}; do
  echo "connection attempt $ATTEMPT/$ATTEMPTS"

  READY=$(bash -c 'exec 3<> /dev/tcp/127.0.0.1/${PORT};echo $?' 2>/dev/null)

  if [[ $READY -eq 0 ]]; then
    echo "connection ready"
    break
  fi

  echo "connection not available, sleeping for ${SLEEP} seconds"

  sleep ${SLEEP}
done
