# How to save build information into target
You need to add those command into pre-build step:
* echo %job_name% #%build_number% %BUILD_ID%   > ./main/shared-UI/src/main/webapp/build.txt
* echo %GIT_BRANCH% of %GIT_URL% @ %GIT_COMMIT%  >> ./main/shared-UI/src/main/webapp/build.txt
* echo %JAVA_HOME% >> ./main/shared-UI/src/main/webapp/build.txt 
* echo %BUILD_URL% >> ./main/shared-UI/src/main/webapp/build.txt 

here %job_name% are Jenkins variable
