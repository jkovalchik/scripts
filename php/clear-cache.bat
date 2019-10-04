@echo off


if not exist app/cache/ goto noCache
echo Clearing cache...
rm -r app/cache
echo Cache cleared!
goto end
:noCache
echo No cache to clear
:end