@echo off

set apk=app-debug.apk

copy %CD%\platforms\android\app\build\outputs\apk\debug\%apk% %CD%\apk\drive.apk