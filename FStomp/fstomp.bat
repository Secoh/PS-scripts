@echo off

REM   Copyright (2022) Secoh
REM   Licensed under the Apache License, Version 2.0
REM   http://www.apache.org/licenses/LICENSE-2.0
REM   Distributed on an "as-is" basis, without warranties or
REM   conditions of any kind.

REM    !! DANGER !!
REM   THIS SCRIPT DESTROYS FILES PERMANENTLY
REM    !! DANGER !!

REM   Usage:
REM   fstomp.bat - destroy all files recursively from the current directory

set /P ans="DANGER DANGER DANGER: This script DESTROYS all files in current directory. Continue? [y/n] "
if /I "%ans%" EQU "Y" goto :accept
echo Cancelled
exit

:accept
(echo $runpath = "%~dp0bin" & type "%~dp0fstomp-process.pshell") | powershell -Command - 2> fstomp-error-log.txt

