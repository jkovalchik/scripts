: need to create symbolic link to iamstatic (shared drive)
: E.g. Where s: is mapped to \\10.1.7.3\$d
:      cd tomcat (catalina.base directory)
:      mkdir static
:      mklink /D static\iamstatic s:\IAMSTATIC


@echo off

set ogDir=%CD%
set projectDir=C:\Users\jkovalchik\git\IamAE\IamAverittApplicationWeb
set webapp=%projectDir%\src\main\webapp
set webInf=%webapp%\WEB-INF
REM set overrideDir=C:\work\override\config\cron
REM set devConfigFile=%overrideDir%\ApplicationConfiguration-DevelopmentDBOverride.properties
REM set tempDir=%CATALINA_HOME%\temp\cron

cd %projectDir%

set target=prepare-package war:exploded
set /p target="target: (%target%) "

REM call set-env.bat

:: Build the maven project
call mvn %target% -DskipTests -Dcatalina.base=%CATALINA_HOME%

:: Move generated files into src/main/webapp/WEB-INF
call project-version.bat
cp -r %projectDir%\target\classes %webInf%
cp -r %projectDir%\target\IamAverittApplicationWeb-%version%\WEB-INF\lib %webInf%

call set-links.bat

call tomcat-start.bat

cd %ogDir%