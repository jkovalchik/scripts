@echo off

:: Remove bundles so that we don't have any unneeded symlinks
if not exist web/bundles goto skipBundles
echo Removing the web/bundles folder...
rm -rf web/bundles
echo Removed the web/bundles folder!
:skipBundles

call clear-cache.bat

echo Reinstalling packages...
call composer install
echo composer update complete!

call migrate.bat
call generate-snapshots.bat
call compile-assets.bat
call clear-cache.bat

echo Setup complete!