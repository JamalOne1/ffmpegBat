# ffmpegBat
A bat/batch file for recording audio, video or desktop by using FFmpeg framework

It's for Windows 10 
Having installed ffmpeg from https://ffmpeg.org/
Setting up the enviroment variabels for FFmpeg

Test command-line command: ffmpeg -version
Find your devices for Microphone, WebCamera and soundcard. By running the command-line command: ffmpeg -list_devices true -f dshow -i dummy
Change the micdevice, videodevice and soundcard setting inside the record.bat file.
Make a directory C:\ffmpeg\out or change the opf setting inside the record.bat file, to where you wish to have the output file.

Start the record.bat file and in command-line you are prompt on following action.

MainMenu
[a]=audio, [w]=webcam, [d]=desktop, [f]=folder, [t]=timesetting, [e]= END ?

Press the letter for each action.

On timesetting you can change the recording time from 10 to 60 sec. 

On folder will showe you a folder where you output files are stored.


Enjoy!

