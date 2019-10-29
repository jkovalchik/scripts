@echo off

set target=android

set /p target="target: (%target%) "

npm run plugin:reinstall && cordova run %target% && call copy-apk.bat && cordova-logs