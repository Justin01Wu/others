rem 

rem create docker images
docker build -f kafka.df -t dev/kafka:2.1.0 .

docker build -f tomcat.df -t dev/tomcat8.5.35 .

rem commit your your build
docker commit -a "Justin Wu" dbe3c3b0991a

rem tag it to a good name
docker tag e9c45e6e3a95 dev/kafka:2.1.0

rem create docker image for Jersey2
docker build -f jersey2.df -t dev/jersey2 .


rem create docker image for vcaps3
docker build -f vcaps.df -t dev/vcaps3 .

docker build -f win10.df -t dev/win10 .


