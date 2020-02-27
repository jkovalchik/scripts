@echo off

set target=android
set update=N

set /p target="target: (%target%) "
set /p update="update: (y/N) "

if [%update%]==[y] (
    call plugin-update.bat && cordova run %target% && call copy-apk.bat && call cordova-logs.bat
) ELSE (
    cordova run %target% && call copy-apk.bat && call cordova-logs.bat
)
