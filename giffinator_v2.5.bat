@echo off
echo   @_____________________________________________________________________________@
echo   ^|^|                                                                           ^|^|
echo   ^|^|  ###     ###   ####    ####   #######   ####    ####   ######    #######  ^|^|
echo   ^|^|   #       #   #    #  #    #   #    #  #    #  #    #   #    #    #    #  ^|^|
echo   ^|^|   #   #   #   #   ##  #   ##   #       #       #   ##   #    #    #       ^|^|
echo   ^|^|   #  # #  #   #  # #  #  # #   #####   #       #  # #   #####     #####   ^|^|
echo   ^|^|   # #   # #   # #  #  # #  #   #       #       # #  #   #  #      #       ^|^|
echo   ^|^|   ##     ##   ##   #  ##   #   #       #       ##   #   #   #     #       ^|^|
echo   ^|^|   #       #   #    #  #    #   #       #    #  #    #   #    #    #    #  ^|^|
echo   ^|^|  ###     ###   ####    ####   ###       ####    ####   ###  ###  #######  ^|^|
echo   ^|^|                                                                           ^|^|
echo   ^|^|                           go to www.woofz.one                             ^|^|
echo   ^|^|                                                                           ^|^|
echo   @'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''@
echo.
echo              [!] FFMPEG.exe needs to be installed or in this directory.

echo.
pause >nul
cls

echo Note: if you're using PNG, the digits at the end should be from 0001.png to 9999.png
set /p inputType= is the input PNG or MP4? (type PNG/MP4): 
if "%inputType%"=="PNG" (echo "> PNG") else (echo "> MP4")
pause >nul
cls

set /p inputName=input filename: 
echo "> %inputName%.%inputType%"
pause >nul
cls

set /p outputName=output filename (.GIF): 
echo "> %inputName%.%inputType% --> %outputName%.GIF"
pause >nul
cls

set /p outputFramerate=framerate: 
echo "> %inputName%.%inputType% --> %outputName%.GIF @ %outputFramerate% FPS"
pause >nul
cls

if "%inputType%"=="PNG" (ffmpeg -i "%inputName%%%4d.png" -r %outputFramerate% -filter_complex  "fps=24,split=2[palette_in][gif];[palette_in]palettegen[palette_out];[gif]fifo[gif_fifo]; [gif_fifo][palette_out]paletteuse" -y "%outputName%.gif") else (ffmpeg -i "%inputName%.mp4" -r %outputFramerate% -filter_complex  "fps=24,split=2[palette_in][gif];[palette_in]palettegen[palette_out];[gif]fifo[gif_fifo]; [gif_fifo][palette_out]paletteuse" -y "%outputName%.gif")

pause >nul