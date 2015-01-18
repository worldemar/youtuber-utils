#!/bin/bash

#
# This script will record 30 fps file from screen directly
#

source config.sh

glgrab64-av ffmpeg \
	    -vsync cfr \
	    -f x11grab ${VINPUT_X11_PARAMS} -i ${VINPUT_X11_DEV} \
	    -f pulse ${AINPUT_SND_PARAMS} -i ${AINPUT_SND_DEV} \
	    -f pulse ${AINPUT_MIC_PARAMS} -i ${AINPUT_MIC_DEV} \
	    -map 0 \
	    -c:v libx264 \
	    -preset ultrafast -crf 18 -me_range 0 -i_qfactor 1 \
	    -map 1 \
	    -c:a libmp3lame -b:a 256k \
	    -f mp4 -r:v 30 \
	    ${OUTPUT_FILENAME_PREFIX}.mp4 \
	    -map 2 \
	    -c:a pcm_s16le \
	    -f wav \
	    ${OUTPUT_FILENAME_PREFIX}.wav
