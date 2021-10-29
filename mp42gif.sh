#!/usr/bin/bash
ffmpeg -i "${1}" -filter_complex "[0:v] ${2},split [a][b];[a] palettegen [p];[b][p] paletteuse" -f gif -y "${1}.gif"
