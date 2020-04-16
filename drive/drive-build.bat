@echo off

:: Change the profile in config.js
set config=E:\work\projects\dispatch-ui\app\js\config\config.js
set str=const ENV = '%profile%';
set search=^const ENV = .*
powershell -Command "(Get-Content %config%) -replace \"%search%\", \"%str%\" | Set-Content %config%"

:: Build the app
call npm run build && call cordova build android --release

:: Sign the app
set apk=E:\work\projects\dispatch-ui\platforms\android\app\build\outputs\apk\release\app-release-unsigned.apk
call drive-sign.bat

:: Zip and optimize
call %ANDROID_HOME%\build-tools\29.0.2\zipalign -v 4 %apk% %folder%\drive-%version%_%profile%.apk