@echo off

set branch=origin/develop
set file=

if not [%1] == [] (set file=%1)
if not [%2] == [] (set branch=%2)

set showWholeFile=-U99999
set diffCommand=git diff %showWholeFile% %branch% %file%
echo %diffCommand%

call %diffCommand%