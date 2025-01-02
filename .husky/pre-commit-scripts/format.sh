#!/usr/bin/env bash

echo "[format] formating code with ruff"

uv run ruff format

# shellcheck disable=SC2181
if [ $? -ne 0 ]; then
  echo "[format] found issues formating code"
  exit 1
fi

exit 0