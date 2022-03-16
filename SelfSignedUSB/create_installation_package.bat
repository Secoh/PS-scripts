@echo off

REM   Copyright (2020) Secoh
REM   Licensed under the Apache License, Version 2.0
REM   http://www.apache.org/licenses/LICENSE-2.0
REM   Distributed on an "as-is" basis, without warranties or
REM   conditions of any kind.

REM   Doesn't require Administrator privileges
REM   Supports Windows drag and drop mode

if "%~1" == "" goto :noparam

cd /d "%~dp0"

if exist TMP goto :baddir
if /i not "%~x1" == ".inf" goto :noinf
if not exist "%~f1" goto :nofile

mkdir TMP
copy "%~f1" TMP > nul

powershell -Command - < mock_cert_inf_to_iso.pshell >> mock_cert.log 2>&1

move %~n1.iso.zip "%~dpn1.iso.zip" > nul

exit

:noparam
echo Usage: %~nx0 name_and_path_of_INF_file.inf
echo You can also drag and drop INF file onto the script in Windows Explorer
pause
exit

:baddir
echo Directory TMP must not be present in the script folder
echo %cd%
pause
exit

:noinf
echo Input file must have INF extension. Your input:
echo %~f1
pause
exit

:nofile
echo Input file does not exist:
echo %~f1
pause
exit

