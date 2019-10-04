@echo off

set target=package
set /p target="target: (%target%) "

call set-myae-env.bat

:: Build the maven project
call mvn %target% -DskipTests -Dwar:exploded

:: Return the config files back to what they used to be.
git checkout %configDir%/ApplicationConfiguration.properties
git checkout %configDir%/ApplicationConfiguration-IAAPPS.properties

:end