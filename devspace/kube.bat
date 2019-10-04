@echo off

set pod=%1
set error=ERROR: You must pass in the pod name as an argument.

if [%pod%]==[] (
    goto error
)

:: Get pod name
REM for /f "delims=" %%G in ('kubectl -n jkovalchik get pod -l release=inside-averitt --output=name') do (set var=%%G)
REM echo %var%

:: Start bash shell inside pod
set namespace=-n jkovalchik
set command=kubectl %namespace% exec -it %pod% bash
call %command%
goto end

:error
echo %error%

:end