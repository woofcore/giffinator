@echo off
echo "To use: Move to directory containing file, name input file INPUT_FILE.mp4 (change in code if different format), framerate is assumed based on input file but if it needs to be changed add "-r (framerate)" to the second ffmpeg line. FFMPEG needs to be installed."
pause
ffmpeg -y -i INPUT_FILE.mp4 -vf palettegen TEMP_PALETTE.png
pause
ffmpeg -y -i INPUT_FILE.mp4 -i TEMP_PALETTE.png -r 24 -filter_complex paletteuse OUTPUT_FILE.gif
del TEMP_PALETTE.png
pause