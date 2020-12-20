#!/bin/bash

ffmpeg -i "$1" -c:v libx264 -preset veryslow -crf 22  -c:a libmp3lame -qscale:a 2 -ac 2 -ar 4410 out.mp4
