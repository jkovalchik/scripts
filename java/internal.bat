@echo off

if [%1] == [] (
	echo ERROR!
	echo USAGE: internal [project] [optional_ant_target]
    goto end
)
:: Default to build-war for the ant target
set target=build-war
if not [%2] == [] (set target=%2)

set project=%1
set tomcat=-Dtomcat.dir=%CATALINA_HOME%
set jsch=-lib C:\work\override\jars\jsch-0.1.53.jar
set maven=-lib C:\work\override\jars\maven-ant-tasks-2.1.3.jar
set outputWarFile=-Doutput.war.file=%project%.war
set outputWarDir=-Doutput.war.dir=%CATALINA_HOME%/wars
set warArgs=%outputWarDir% %outputWarFile%
set cleanDir=%CATALINA_HOME%/webapps/%project%

rm -r %cleanDir%
call ant %target% %tomcat% %jsch% %maven% %warArgs%

:end