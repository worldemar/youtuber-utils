#!/bin/bash

source config.sh

glgrab64-av ffmpeg -f glgrab $VINPUT_GL_PARAMS -i ${VINPUT_GL_DEV} -vpre cinelerra -f avi - | ffplay -loglevel quiet -
