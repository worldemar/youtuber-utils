#!/bin/bash

#
# This config file is an example. Tune variables to fit your setup.
#

#
# VIDEO INPUT DEVICES
#

# you can explicitly specify /dev/videoX if you have one camera
VINPUT_CAM_DEV="/dev/v4l/by-id/usb-Microsoft_Microsoft®_LifeCam_HD-5000-video-index0"
VINPUT_CAM_PARAMS="-s 640x480 -input_format yuyv422 -framerate 30"
# we assume you will not want to capture two GL windows simultaneously
VINPUT_GL_DEV="/dev/shm/glgrab*"
VINPUT_GL_PARAMS="-s 1920x1080 -framerate 30"
VINPUT_GL_PARAMS_60="-s 1920x1080 -framerate 60"


VINPUT_X11_DEV=":0.0"
VINPUT_X11_PARAMS="-s 1920x1080 -framerate 30"

#
# AUDIO INPUT DEVICES
#

# (use pactl list sources | grep Name to get list of devices)
# select your preferred mic (note that it should be "alsa_input")
AINPUT_MIC_DEV="alsa_input.usb-Line_6_UX2-00-PODStudioUX2.analog-stereo"
AINPUT_MIC_PARAMS="-sample_rate 48000"

# select "monitor" of your output so game/playback audio will also be recorded
AINPUT_SND_DEV="alsa_output.usb-Line_6_UX2-00-PODStudioUX2.analog-stereo.monitor"
AINPUT_SND_PARAMS="-sample_rate 48000"

#
# OUTPUT OPTIONS
#

OUTPUT_FILENAME_PREFIX=$(date +"%Y%m%d_%H%M%S")
