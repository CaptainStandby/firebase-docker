#!/bin/bash
set -e

cd "$WORKDIR"

if [ "$1" = "firebase" ]; then
    shift 1
fi

exec firebase "$@"
