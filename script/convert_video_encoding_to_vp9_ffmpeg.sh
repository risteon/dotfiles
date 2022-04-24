#!/bin/bash

set -ex

input_file=$1

if [ -z "$2" ]
then
  output_file=${input_file/.*/.webm}
else
  output_file="$2"
fi

ffmpeg_executable=$HOME/system/ffmpeg-git-20220422-amd64-static/ffmpeg
quality_setting=30

$ffmpeg_executable -i $input_file -c:v libvpx-vp9 -b:v 0 -crf $quality_setting -pass 1 -an -f null /dev/null && $ffmpeg_executable -i $input_file -c:v libvpx-vp9 -b:v 0 -crf $quality_setting -pass 2 -c:a libopus $output_file

