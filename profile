#!/usr/bin/env bash

export XDG_DATA_DIRS="$HOME/.nix-profile/share:${XDG_DATA_DIRS}"

export TZ=:/etc/localtime
. "$HOME/.cargo/env"
