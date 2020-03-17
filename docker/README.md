# Docker

## Basic 
+ Docker will automatically download image and its dependencies if they are not in the local for first time running
+ Docker image will automatically quit if there is no service is started from your CMD
+ You can use bash service to stop image quiting for testing
+ Docker image never save anything in the image, this is the biggest difference from VM machine
+ To save something, you have to share your host folder into the image
+ Docker image is much smaller than VM image, but it is still big

## Common commands:
+ run a image: `docker run -p 8686:8080 -it dev/tomcat8.5.35 bash`
	+ `-p 8686:8080` image port map to host port 
	+ `dev/tomcat8.5.35` : image name plus version
	+ `bash` : add an extra command after the image is started
+ run a image: `docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:5.7.29`
	+ `--name some-mysql` give instance a good name, otherwise it is a process number
	+ `-e MYSQL_ROOT_PASSWORD=my-secret-pw`  : Set environment variables
	+ -d Run container in background and print container ID
	+ `mysql:5.7.29`  image name plus version
+ find running instance:  `docker ps`
+ get help : docker run --help
+ build a image: `docker build -f tomcat.df -t dev/tomcat8.5.35 .`
	+ `-f tomcat.df`  specify builder file 
	+ `-t dev/tomcat8.5.35` specify target image name
	+ `.` target folder
+ stop an image instance: `docker stop 32f37a14ed6f`
	+ `32f37a14ed6f` image container Id(processId)
 
## Troubles:
+ I need to restart docker desktop after I re-login, otherwise I can't run docker:
```
	C:\samples\others\others\others\docker>docker run -p 8686:8080 -it dev/tomcat8.5.35 bash
	docker: Error response from daemon: driver failed programming external connectivity on endpoint vigorous_swanson 
	(795de4408b54c48c37a8960cabafb2f60a8b092a17834f091ab958847b7d63bc): 
	Error starting userland proxy: mkdir /port/tcp:0.0.0.0:8686:tcp:172.17.0.2:8080: input/output error.
```

## Docker resources
+ docker hub:  https://hub.docker.com/
