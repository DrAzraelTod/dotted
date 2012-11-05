#! /bin/bash

ffmpeg -i "$1" -acodec liblame -ab 160k -ar 44100 -ac 2 "$2"

