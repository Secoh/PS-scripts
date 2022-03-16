@echo off
echo Established: > tstomp.log
powershell -Command get-date >> tstomp.log
powershell -Command - < "%~dpn0.pshell" 2>> tstomp.log
