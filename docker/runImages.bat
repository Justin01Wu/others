rem 

docker run demo/openjdk:8 

rem run and open it
rem docker run -it demo/openjdk:8 sh

rem docker run -p 2180:2180 -p 9092:9092 -it dev/kafka:2.1.0 bash

rem expose inner tomcat 8080 to host 8686 
rem docker run -p 8686:8080 -it dev/tomcat8.5.35 bash

rem docker run -p 8686:8080 -it dev/jersey2 bash

rem docker run -p 8686:8080 -it dev/vcaps3 bash

rem attach host folder to container
rem docker run -p 8686:8080 -it -v C:/projects/merging/vcaps/main:/outside dev/vcaps3 bash




