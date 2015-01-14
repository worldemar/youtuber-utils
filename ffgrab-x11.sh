#!/bin/bash

#
# This script will record 30 fps file from screen directly
# recording mov file compatible with cinelerra
#

source config.sh

glgrab64-av ffmpeg \
	    -vsync cfr \
	    -f x11grab $VINPUT_X11_PARAMS -i ${VINPUT_X11_DEV} \
	    -f pulse $AINPUT_SND_PARAMS -i ${AINPUT_SND_DEV} \
	    -f pulse $AINPUT_MIC_PARAMS -i ${AINPUT_MIC_DEV} \
	    -vpre:0 cinelerra -pix_fmt:0 yuv420p \
	    -f mov -movflags faststart -map 0 -r:v 30 \
	    ${OUTPUT_FILENAME_PREFIX}_scr.mov \
	    -apre:1 cinelerra \
	    -f wav -map 1 \
	    ${OUTPUT_FILENAME_PREFIX}_snd.wav \
	    -apre:2 cinelerra \
	    -f wav -map 2 \
	    ${OUTPUT_FILENAME_PREFIX}_mic.wav
