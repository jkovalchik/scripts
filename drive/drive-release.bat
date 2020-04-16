@echo off

if [%1] == [] (
    echo err: version argument required
    goto end
)

set version=%1
set folder=E:\work\drive\releases\v%version%

:: Make sure release folder exists
if not exist "%folder%" mkdir "%folder%"

:: Build beta apk
set profile=beta
if not exist "%folder%\drive-%version%_%profile%.apk" (
    call drive-build.bat
)

:: Build qa apk
set profile=qa
if not exist "%folder%\drive-%version%_%profile%.apk" (
    call drive-build.bat
)

:: Build dev apk
set profile=dev
if not exist "%folder%\drive-%version%_%profile%.apk" (
    call drive-build.bat
)

:end