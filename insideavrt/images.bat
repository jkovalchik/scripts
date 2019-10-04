@echo off

scp -rC webmanager@apacheprod:/var/www/InsideAvrt-3/web/uploads C:/work/override/ia
tar -cvzf uploads.tar.gz uploads