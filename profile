#!/usr/bin/env bash


export XDG_DATA_DIRS="$HOME/.nix-profile/share:${XDG_DATA_DIRS}"

export TZ='America/Los_Angeles'

if [ -e "$HOME"/.nix-profile/etc/profile.d/nix.sh ]; then
    . "$HOME"/.nix-profile/etc/profile.d/nix.sh;
fi # added by Nix installer

if [ -e "$HOME"/.cargo/env ]; then
. "$HOME"/.cargo/env
fi
