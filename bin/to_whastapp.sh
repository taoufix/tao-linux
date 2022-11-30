#!/bin/bash

ffmpeg -i "$1" -vcodec libx264 -acodec aac whatsapp.mp4
