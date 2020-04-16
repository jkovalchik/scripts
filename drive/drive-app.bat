@echo off

set target=android

set /p target="target: (%target%) "

npm run build && cordova run %target% && call copy-apk.bat && call cordova-logs.bat