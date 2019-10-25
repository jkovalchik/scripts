@echo off

set apk=app-debug.apk

npm run build && cordova run android && cordova-logs
copy %CD%\platforms\android\app\build\outputs\apk\debug\%apk% %CD%\apk\drive.apk