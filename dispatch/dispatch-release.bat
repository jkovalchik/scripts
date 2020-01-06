@echo off

set target=android
npm run build && cordova build %target% && call copy-apk.bat