@echo off

REM   Copyright (2022) Secoh
REM   Licensed under the Apache License, Version 2.0
REM   http://www.apache.org/licenses/LICENSE-2.0
REM   Distributed on an "as-is" basis, without warranties or
REM   conditions of any kind.

REM   Usage:
REM   tstomp.bat  - change time/date on files in current directory (recursively) to the current time
REM   tstomp.bat <directroy>  - given directory, current time
REM   tstomp.bat . <file>  - current directory, set the same time as of the given file
REM   tstomp.bat <directory> <file>  - given directory, time of given file
  

if "%~1" == "" goto :nodir
set target="%~f1"
if exist "%target%" goto :havedir
echo Doesn't exist: "%target%"
exit

:nodir
call :convert "."

:havedir

if "%~2" == "" goto :nosample
set sample="%~f2"
if exist "%sample%" goto :havesample
echo Doesn't exist: "%sample%"
exit

:nosample
set sample=""

:havesample

"%~dp0tstomp-helper-make-script.bat" %target% %sample% | powershell -Command -
rem Use redirection to file (such as "> test.txt") to see the actual powershell script to run
exit

:convert
set target="%~f1"
goto :eof
