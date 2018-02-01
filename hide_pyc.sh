#!/usr/bin/env bash
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

cd "$SCRIPTPATH/.."

hide() {
  for d in *.py[co]; do
    if [ -f "$d" ]; then
      echo $d
    fi
  done | tee "$(pwd)/.hidden" > /dev/null
}

recursive() {
  for d in *; do
    if [ -d "$d" ]; then
      (cd -- "$d" && hide)
      (cd -- "$d" && recursive)
    fi
  done
}

(recursive)
