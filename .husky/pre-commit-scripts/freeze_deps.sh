#!/usr/bin/env bash

echo "[freeze_deps] creating requirements.txt file"

uv pip freeze > requirements.txt

# shellcheck disable=SC2181
if [ $? -ne 0 ]; then
  echo "[freeze_deps] error creating requirements.txt file"
  exit 1
fi

git add --all

exit 0