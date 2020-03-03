@echo off

set docker_pass=webmanager
set docker_user=1outhouse

set jibFromArgs=-Djib.from.auth.username=%docker_user% -Djib.from.auth.password=%docker_pass%
set jibToArgs=-Djib.to.auth.username=%docker_user% -Djib.to.auth.password=%docker_pass%

set project=project
set /p project="project: (%project%) "

set image=develop
set /p image="image: (%image%) "

set destArg=-Djib.to.image=harbor.insideaveritt.com/api/%project%:%image%

set jibVersion=2.1.0
set target=compile com.google.cloud.tools:jib-maven-plugin:%jibVersion%:build

mvn %target% %jibFromArgs% %jibToArgs% %destArg%