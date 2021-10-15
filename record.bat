@echo off
TITLE Record
set ts=10
set opf=C:\ffmpeg\out\
set micdevice="Microphone (USB Audio Device)"
set videodevice="USB Video Device"
set soundcard="Stereo Mix (Realtek(R) Audio)"

:menu
ECHO.
ECHO MainMENU
SET /p menu="[a]=audio, [w]=webcam, [d]=desktop, [f]=folder, [t]=timesetting, [e]= END ?"

set d=%date:~6,4%%date:~3,2%%date:~0,2%
set t=%time:~0,2%%time:~3,2%%time:~6,2%
set t=%t: =0%
set n=%d%-%t%

IF /i "%menu%" == "a" GOTO audio
IF /i "%menu%" == "w" GOTO webcam
IF /i "%menu%" == "f" GOTO folder
IF /i "%menu%" == "d" GOTO desktop
IF /i "%menu%" == "t" GOTO timesetting
IF /i "%menu%" == "e" GOTO end
ECHO Invalid Option
GOTO start

:timesetting
ECHO .Recordtime setting
Set /p timesetting="[1]=10sec, [2]=20sec, [3]=30sec, [4]=40sec, [5]=50sec, [6]=60sec ?"
IF /i "%timesetting%" == "1" set ts=10
IF /i "%timesetting%" == "2" set ts=20
IF /i "%timesetting%" == "3" set ts=30
IF /i "%timesetting%" == "4" set ts=40
IF /i "%timesetting%" == "5" set ts=50
IF /i "%timesetting%" == "6" set ts=60
ECHO.
ECHO Recordtime is set to %ts%
GOTO menu

:audio
ECHO.
ECHO Audio recording from %micdevice% for %ts%sec to %opf% 
ECHO.
ffmpeg -f dshow -i audio=%micdevice% -t %ts% %opf%Mic%n%.mp3
GOTO menu

:webcam
ECHO.
ECHO Webcam recording from %videodevice% for %ts%sec to %opf% test %~dp0
ECHO.
ffmpeg -f dshow -framerate 15 -i video=%videodevice%:audio=%micdevice% -t %ts% %opf%WebCam%n%.mp4"
GOTO menu

:desktop
ECHO.
ECHO Desktop recording from %soundcard% for %ts%sec to %opf%
ECHO.
ffmpeg -f gdigrab -framerate 30 -i desktop -f dshow -i audio=%soundcard% -t %ts% %opf%ScrCap%n%.mkv
GOTO menu 

:folder
ECHO.
ECHO Open output folder - %opf%
ECHO.
start %SystemRoot%\explorer.exe %opf%
GOTO menu 

:end
ECHO BYE BYE
PAUSE
