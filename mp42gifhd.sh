#!/usr/bin/bash
ffmpeg -i "${1}" -filter_complex "[0:v] ${2},split [a][b];[a] palettegen=stats_mode=single [p];[b][p] paletteuse=new=1" -f gif -y "${1}_hd.gif"
