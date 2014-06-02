#!/bin/bash

source config.sh

ffmpeg -f v4l2 $VINPUT_CAM_PARAMS -i ${VINPUT_CAM_DEV} -vpre cinelerra -f avi - | ffplay -loglevel quiet -
