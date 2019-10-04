@echo off

echo Compiling assets...

if not exist web/assetic goto skipAssetic
rm -rf web/assetic
git checkout web/assetic/jqueryui_js.js
:skipAssetic

php app/console assets:install web --symlink
call compass compile $(pwd)/src/Application/Sonata/PageBundle/Resources/public
call compass compile $(pwd)/src/Application/SellWell/Sellwell/Resources/public
call compass compile $(pwd)/src/Application/SellWell/Leadwell/Resources/public
php app/console assetic:dump

echo Compiling assets complete!