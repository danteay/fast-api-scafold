#!/usr/bin/env bash

echo "[lint] code linting with ruff"

uv run ruff check --fix

# shellcheck disable=SC2181
if [ $? -ne 0 ]; then
  echo "[lint] found issues in code linting"
  exit 1
fi

git add --all

exit 0