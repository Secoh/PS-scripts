@echo off

REM   Copyright (2020) Secoh
REM   Licensed under the Apache License, Version 2.0
REM   http://www.apache.org/licenses/LICENSE-2.0
REM   Distributed on an "as-is" basis, without warranties or
REM   conditions of any kind.

REM   This script requires Administrator privileges

REM   On the clean system, creates, registers, and exports
REM   new signing certificate (self-signed)

REM   If the certificate already exists, uses it
REM   to regenerate export certificate files
REM   (Useful if the files were deleted)

REM   For completeness, if a PFX file is given as parameter
REM   the script tries to import certificate from
REM   that PFX file and copy it to the script folder

net session > nul 2>&1
if %errorlevel% neq 0 goto :noadmin

cd /d "%~dp0"

del mock_cert_import.lock 2> nul

if "%~1" == "" goto :normalrun
if /i not "%~x1" == ".pfx" goto :nopfx
if not exist "%~f1" goto :nofile

set target="%~nx1"
call :convert %target%

if /i "%target%" == "%~f1" goto :samefile

if exist "%~nx1" goto :nooverwrite

echo Import PFX: Copying file "%~nx1" to the script folder
copy "%~f1" "%~nx1" > nul 2>&1
goto :normalimport

:samefile
echo Import PFX: Taking file "%~nx1" from the script folder

:normalimport
echo do import > mock_cert_import.lock

:normalrun

echo See mock_cert.log for more details...
powershell -Command - < mock_cert_new.pshell >> mock_cert.log 2>&1

del mock_cert_import.lock 2> nul
exit

:noadmin
echo This script must be run with Administrator privileges
pause
exit

:nopfx
echo Import PFX: Certificate file must have PFX extension (entered: "%~nx1")
pause
exit

:nofile
echo Import PFX: Certificate file doesn't exist
echo %~f1
pause
exit

:convert
set target=%~f1
goto :eof

:nooverwrite
echo Import PFX: File with name "%~nx1" already exists in the script folder, will not overwrite
pause
exit

