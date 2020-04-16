@echo off

set store=E:\work\drive\releases\drive.keystore

:: jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore <keystorename> <Unsigned APK file> <Keystore Alias name> -tsa <proven source for a timestamp>
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore %store% %apk% drivekeystore -storepass TheCodeSmith#1 -tsa http://timestamp.digicert.com