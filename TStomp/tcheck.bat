@echo off

REM   Copyright (2022) Secoh
REM   Licensed under the Apache License, Version 2.0
REM   http://www.apache.org/licenses/LICENSE-2.0
REM   Distributed on an "as-is" basis, without warranties or
REM   conditions of any kind.

REM   Usage:
REM   tcheck.bat - find any file recursively that has Create or Modify timestamps Mon-Fri, 9am-5pm

type "%~dp0tcheck.pshell" | powershell -Command -

