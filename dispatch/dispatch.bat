@echo off

npm run build && cordova run android && call copy-apk.bat && cordova-logs