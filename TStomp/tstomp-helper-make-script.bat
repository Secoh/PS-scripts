@echo off

REM   Copyright (2022) Secoh
REM   Licensed under the Apache License, Version 2.0
REM   http://www.apache.org/licenses/LICENSE-2.0
REM   Distributed on an "as-is" basis, without warranties or
REM   conditions of any kind.

REM   DO NOT RUN THIS FILE DIRECTLY
REM   Use tstomp.bat

echo $list = (get-childitem %1 -include * -recurse -force)
echo $now_source = %2
type "%~dp0tstomp-process.pshell"
