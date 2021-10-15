#!/bin/bash
set -ex

shopt -s extglob

CURRENT_DIRECTORY="$(pwd -P)"

for f in !(*.sh)
do
  ln -fs  "$CURRENT_DIRECTORY/$f" "$HOME/.$f"
done
