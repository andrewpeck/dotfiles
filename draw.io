#!/usr/bin/env bash
/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=run.sh --file-forwarding com.jgraph.drawio.desktop "$@"
