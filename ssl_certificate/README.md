# About SSL Certificate

## WildCard certificate
+ You can't use Java KeyTool to create because it has 
[a bug](https://stackoverflow.com/questions/33827789/self-signed-certificate-dnsname-components-must-begin-with-a-letter)
+ You can use openSSL to do [this job](https://www.switch.ch/pki/manage/request/csr-openssl/)

## file extension for openSSL
+ cnf: config file for openSSL, it can set many data for creating a certificate to avoid input manually
+ PEM: The PEM extension is used for different types of X.509v3 files which contain ASCII (Base64) armored data prefixed with a “—– BEGIN …” line.
+ CRT: The CRT extension is used for certificates. The certificates may be encoded as binary DER or as ASCII PEM. 
   The CER and CRT extensions are nearly synonymous.  Most common among *nix systems
+ KEY: The KEY extension is used both for public and private PKCS#8 keys. The keys may be encoded as binary DER or as ASCII PEM.  
+ CSR:  Certificate Signing Request file used by websites to authenticate their identity to a Certificate Authority.

Please see [here](https://support.ssl.com/Knowledgebase/Article/View/19/0/der-vs-crt-vs-cer-vs-pem-certificates-and-how-to-convert-them) for details 