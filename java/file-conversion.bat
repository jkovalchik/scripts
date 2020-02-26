@echo off

set user=db2admin
set pass=meowhow9
set target=spring-boot:run
set configBranch=develop
set profile=development

set /p target="target: (%target%) "

set /p profile="env: (development) "
if [%profile%]==[PROD] (set profile=production)
if [%profile%]==[Prod] (set profile=production)
if [%profile%]==[prod] (set profile=production)
if [%profile%]==[p] (set profile=production)
if [%profile%]==[P] (set profile=production)

if [%profile%]==[production] (
	set username=webadmin
)
set arguments=-Dspring.datasource.username=%user% -Dspring.datasource.password=%pass% -Dspring.cloud.config.label=%configBranch% -Dspring.profiles.active=%profile%

call mvn %target% -Dspring-boot.run.jvmArguments="%arguments%"