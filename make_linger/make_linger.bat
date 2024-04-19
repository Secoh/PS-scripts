@echo off

call :perform .
exit

:perform

rem echo %~nx1

mkdir C:\Users\Public\Linger 2> nul
mkdir C:\Users\Public\Linger\vs 2> nul

mkdir C:\Users\Public\Linger\vs\%~nx1 2> nul

rd /q/s .vs
junction .vs C:\Users\Public\Linger\vs\%~nx1
