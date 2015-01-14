#!/bin/bash

#
# This script will record two 30 fps files from camera and OpenGL application
# resulting in two mov files compatible with cinelerra
#

source config.sh

glgrab64-av ffmpeg \
	    -vsync cfr \
	    -f glgrab $VINPUT_GL_PARAMS -i ${VINPUT_GL_DEV} \
	    -f pulse $AINPUT_SND_PARAMS -i ${AINPUT_SND_DEV} \
	    -vpre:0 cinelerra \
	    -f mov -movflags faststart -map 0 -r:v 30 \
	    ${OUTPUT_FILENAME_PREFIX}_scr.mov \
	    -apre:1 cinelerra \
	    -f wav -map 1 \
	    ${OUTPUT_FILENAME_PREFIX}_snd.wav

