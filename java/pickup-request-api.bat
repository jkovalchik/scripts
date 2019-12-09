@echo off

set mode=development
set username=db2admin
set password=meowhow9
set target=spring-boot:run
set configBranch=develop

set /p target="target: (spring-boot:run) "

set /p mode="env: (development) "
if [%mode%]==[PROD] (set mode=production)
if [%mode%]==[Prod] (set mode=production)
if [%mode%]==[prod] (set mode=production)
if [%mode%]==[p] (set mode=production)
if [%mode%]==[P] (set mode=production)

if [%mode%]==[production] (
	set username=webadmin
)
set credentials=-Dspring.datasource.username=%username% -Dspring.datasource.password=%password%
set cloudConfig=-Dspring.cloud.config.label=%configBranch% -Dspring.profiles.active=%mode%

set arguments=%credentials%

call mvn %target% %arguments%