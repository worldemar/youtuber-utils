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
	    -vpre:0 cinelerra -apre:1 cinelerra -apre:2 cinelerra -pix_fmt:0 yuv420p \
	    -f mov -movflags faststart -map 0 -map 1 -map 2 -r:v 30 \
	    ${OUTPUT_FILENAME_PREFIX}_scr.mov
