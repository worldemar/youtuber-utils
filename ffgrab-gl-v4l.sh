#!/bin/bash

#
# This script will record two 30 fps files from camera and OpenGL application
# resulting in two mov files compatible with cinelerra
#

source config.sh

glgrab64-av ffmpeg \
-vsync cfr \
-f v4l2 $VINPUT_CAM_PARAMS -i ${VINPUT_CAM_DEV} \
-f pulse $AINPUT_MIC_PARAMS -i ${AINPUT_MIC_DEV} \
-f glgrab $VINPUT_GL_PARAMS -i ${VINPUT_GL_DEV} \
-f pulse $AINPUT_SND_PARAMS -i ${AINPUT_SND_DEV} \
-vpre:0 cinelerra -apre:1 cinelerra -pix_fmt:0 yuv420p \
-f mov -movflags faststart -map 0 -map 1 -r:v 30 \
${OUTPUT_FILENAME_PREFIX}_cam.mov \
-vpre:2 cinelerra -apre:3 cinelerra -pix_fmt:2 yuv420p \
-f mov -movflags faststart -map 2 -map 3 -r:v 30 \
${OUTPUT_FILENAME_PREFIX}_scr.mov

