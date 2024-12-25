#!/bin/bash

find . -name "*.aif" -print0 -exec sh -c 's="{}"; ffmpeg -y -i "$s" -f mp3 -ab 192000 -ar 44100 "${s%.*}.mp3"' \;

