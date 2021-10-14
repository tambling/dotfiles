#!/bin/bash

set -ex

DOTFILESDIRREL="$(dirname "$0")"
cd $DOTFILESDIRREL/..
DOTFILESDIR="$(pwd -P)"

ln -sf "$DOTFILESDIR" "$HOME/.dotfiles"

brew install rcm

rcup -d "$HOME/.dotfiles"
