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
VINPUT_GL_PARAMS="-s 1920x1080 -framerate 30 -pix_fmt yuv420p"

#
# AUDIO INPUT DEVICES
#

# (use pactl | grep Name to get list of devices)
# select your preferred mic (note that it should be "alsa_input")
AINPUT_MIC_DEV="alsa_input.usb-Shure_Incorporated_Shure_Digital-00-Digital.analog-stereo"
AINPUT_MIC_PARAMS="-sample_rate 48000"

# select "monitor" of your output so game/playback audio will also be recorded
AINPUT_SND_DEV="alsa_output.usb-Shure_Incorporated_Shure_Digital-00-Digital.analog-stereo.monitor"
AINPUT_SND_PARAMS="-sample_rate 48000"

#
# OUTPUT OPTIONS
#

OUTPUT_FILENAME_PREFIX=$(date +"%Y%m%d_%H%M%S")

#
# SANITY CHECK
#

# everything below must check that config has no obvious flaws
# (nonexistent devices selected, etc) and fail with appropriate message

function check_exists() {
    if [[ ! -e ${1} ]]; then
	echo "Sanity check failed: ${1} does not exist"
	exit 1
    fi
}

check_exists ${VINPUT_GL_DEV}
check_exists ${VINPUT_CAM_DEV}
