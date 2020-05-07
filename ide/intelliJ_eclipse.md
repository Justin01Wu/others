
# Migrate a project to IntelliJ from Eclipse


## maven build
I just did some testing this afternoon and found those things:
+ 	Maven doesn’t support Incremental building well. 
     + It needs about 4m:45s to build the whole VCAPS project every time we switch the branch
     + rebuild whole project without changing: 4m:23s
+ 	Most of time Eclipse support Incremental building well:
    It just needs a few seconds to rebuild the whole VCAPS project when we switch the branch
+	Until now Eclipse still have troubles to support embedded Git function in IDE
    So we have to use 3rd party tools to switch the branch then refresh project in Eclipse
+	Need to set some environment related things in Eclipse after we switch a branch 
    Like we need to set new breakpoints, need to set vcaps.properties, and need clean browser cache, which cause more time than building the project
+	Occasionally Eclipse got confused to compile the project, specially happens when a workspace is not used for a while. 
     In those situation, we need to re-build the whole project

## Why to migrate to IntelliJ
 
+ Eclipse has troubles to handle Azure Git
+ and it gave up JavaScript support since 2018.
+ IntellJ has much better support on Javascript and html.

## How to migrate to IntelliJ
import VCAPS project into IntellJ:
+   assumed source code is cloned
+   File -> new -> Project from existing sources
+   set root on C:\projects\intellJ2\develop\vcaps-svn-git\main, this folder usually should have a pom.xml file and README.md
+   select "import project from external model" when import it
+   choose "Maven", not Eclipse
+   choose "this window "

## How to build project in IntelliJ
Build the project in IntellJ:

1. remove unnecessary modules except shared-java, shared-UI, Treaty , DNF
2.  maven -> re-import those modules
    1.   you maybe need to setup JDK for this project in File -> Project Structure
3.  Because IntelliJ has different explanation on maven process from Eclipse, many maven  process need to be adjusted for it:
    1.   need to remove version999 related maven process in shared-UI
    2.   need to remove jspc-maven-plugin maven process in shared-UI
	3.   need to remove buildVersion888 related maven process in Treaty, also remove maven-war-plugin	
4.  build module Treaty in maven view, should succeed
5.  run -> edit configuration -> add new config(+) -> tomcat server-> local -> configure: then choose external tomcat folder
6.  change url to http://localhost:8080/vcaps3
7.  go to deployment tab, it is empty, now add "Treaty:war exploded" into it, not "Treaty:war" 
8.  change application context to /vcaps3
9.  start tomcat, now you can see the result in the browser


## IntelliJ Tips
+ IntelliJ will create a temporary folder to run tomcat
    + by default it is : C:\Users\justin.wu\.IntelliJIdea2019.3\system\tomcat\Tomcat_8_5_432_main\
    + it includes war and logs
	+ it will print as CATALINA_BASE in the beginning of the tomcat console 
+ you need to do something to enable hot deploy:  
    https://mkyong.com/intellij/intellij-idea-auto-reload-a-web-application-hot-deploy/	
+ IntelliJ has multiple set of keyMap, one is copied from Eclipse(file-> setting->keyMap), so you will have easy life if you use it

## Compare with Eclipse:
+ By default, IntelliJ used big font, will show less lines in the same size windows
+ Only basic version of IntelliJ is free, it has limited function, like no JSP or Javascript supporting
+ Eclipse has 2-3 times more plugin than IntelliJ, for example, I didn't find AWS plugin for IntelliJ 
+ IntelliJ used about 3-4 times memory than Eclipse, more disk space than Eclipse
+ Both have good supporting for Java
    + But Eclipse can support other languages: Python, C++
    + IntelliJ has much better supporting on JavaScript and TypeSCript
+ IntelliJ is better than Eclipse in those areas:
    + debugging
    + refactoring
    + Usability
    + Autocomplete
+ Eclipse is better than IntelliJ in those areas:  
    + Performance
    + Old technology, like JSF
    + plugin  
+ "go back" in VSC, Eclipse and Adobe pdf reader are the same "alt+ left arrow", but IntelliJ default is different
 