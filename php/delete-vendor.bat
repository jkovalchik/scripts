@echo off

:: Remove vendors so that we don't have any unneeded dependencies
if not exist vendor goto skipVendor
echo Removing the vendor folder...
rm -rf vendor
echo Removed the vendor folder!
goto end
:skipVendor
echo Folder already deleted
:end