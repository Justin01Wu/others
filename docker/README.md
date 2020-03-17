# Docker

## basic 
+ Docker will automatically download image and its dependencies if they are not in the local for first time running
+ Docker image will automatically quit if there is no service is started from your CMD
+ You can use bash service to stop image quiting for testing
+ Docker image never save anything in the image, this is the biggest difference from VM machine
+ To save something, you have to share your host folder into the image
+ Docker image is much smaller than VM image, but it is still big

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
