#!/bin/bash

#
# This script will record 30 fps from X11
# and stream it via twitch.tv with desktop audio and microphone.
#
#           /!\ YOUR ENTIRE SCREEN WILL BE CAPTURED /!\
#
# DO NOT SHOW STREAMKEY OR OTHER PRIVATE INFORMATION WHILE CASTING
#
# you will probably want to tweak some bitrate numbers
# but be careful with other stuff - it is pretty much mandatory
#

source config.sh

glgrab64-av ffmpeg \
	    -vsync cfr \
	    -f x11grab ${VINPUT_X11_PARAMS} -i ${VINPUT_X11_DEV} \
	    -f pulse ${AINPUT_SND_PARAMS} -i ${AINPUT_SND_DEV} \
	    -f pulse ${AINPUT_MIC_PARAMS} -i ${AINPUT_MIC_DEV} \
	    -filter_complex "[1:0][2:0]amerge=inputs=2" \
	    -f flv -ac 2 -ar 44100 -c:v libx264 -g 60 -b:v 2000k -pix_fmt yuv420p \
	    -preset fast -strict -2 -c:a libmp3lame -b:a 128k -bufsize 2000k \
	    rtmp://live-fra.twitch.tv/app/$TWITCH_STREAMKEY
