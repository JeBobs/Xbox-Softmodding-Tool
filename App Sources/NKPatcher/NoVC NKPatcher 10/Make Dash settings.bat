@Echo off
del /Q "*.xbe" 2>NUL


:: Rename all ASM files.
rename "header.asm" "header1.asm" >NUL
rename "Dash Settings.asm" "header.asm" >NUL
rename "Dash Settings.inc" "config.inc" >NUL


:: Build ASM files & sign the xbe.
Echo:
Echo Building NKPatcher 10
Echo:
nasm -o default.xbe xboxapp.asm
Echo:
Echo Signing default.xbe
Echo:
xbedump default.xbe -habibi >NUL

:: Remove old default.xbe, as its now signed then rename out.xbe.
del default.xbe
rename out.xbe default.xbe >NUL


:: Move XBE to its own folder.
md "Dash Settings" >NUL
move "*.xbe" "Dash Settings" >NUL


:: Rename all ASM files back.
rename "config.inc" "Dash Settings.inc" >NUL
rename "header.asm" "Dash Settings.asm" >NUL
rename "header1.asm" "header.asm" >NUL

pause