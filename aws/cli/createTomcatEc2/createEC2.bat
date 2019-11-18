@echo off
setlocal

rem  create EC2 instance from CLI:

set para1=--image-id ami-00dc79254d0461090 --instance-type t2.micro
set para2=--iam-instance-profile Name=WebServerRole --key-name MyUser2KP --security-groups WebDMZ
set para3=--user-data file://install_tomcat8.5.txt

echo aws ec2 run-instances %para1%  %para2% %para3%
aws ec2 run-instances %para1%  %para2% %para3%