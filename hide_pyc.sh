#!/usr/bin/env bash
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

cd "$SCRIPTPATH/.."

recursiverm() {
  for d in *; do
    if [ -d "$d" ]; then
      ls *.py[co] > .hidden
      (cd -- "$d" && recursiverm)
    fi
  done
}

(recursiverm)
