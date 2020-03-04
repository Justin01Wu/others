# About SSL Certificate

## WildCard certificate
+ You can't use Java KeyTool to create because it has 
[a bug](https://stackoverflow.com/questions/33827789/self-signed-certificate-dnsname-components-must-begin-with-a-letter)
+ You can use openSSL to do [this job](https://www.switch.ch/pki/manage/request/csr-openssl/)

