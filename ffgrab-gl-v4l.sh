#!/bin/bash

#
# This script will record two 30 fps files from camera and OpenGL application
#

source config.sh

glgrab64-av ffmpeg \
	    -vsync cfr \
	    -f glgrab ${VINPUT_GL_PARAMS} -i ${VINPUT_GL_DEV} \
	    -f pulse ${AINPUT_SND_PARAMS} -i ${AINPUT_SND_DEV} \
	    -f v4l2 ${VINPUT_CAM_PARAMS} -i ${VINPUT_CAM_DEV} \
	    -f pulse ${AINPUT_MIC_PARAMS} -i ${AINPUT_MIC_DEV} \
	    -map 0 \
	    -c:v libx264 \
	    -preset ultrafast -crf 18 -me_range 0 -i_qfactor 1 \
	    -map 1 \
	    -c:a libmp3lame -b:a 256k \
	    -f mp4 -r:v 30 \
	    ${OUTPUT_FILENAME_PREFIX}_s.mp4 \
	    -map 2 \
	    -c:v libx264 \
	    -preset ultrafast -crf 18 -me_range 0 -i_qfactor 1 \
	    ${OUTPUT_FILENAME_PREFIX}_c.mp4
	    -map 3 \
	    -c:a pcm_s16le \
	    -f wav \
	    ${OUTPUT_FILENAME_PREFIX}_c.wav
