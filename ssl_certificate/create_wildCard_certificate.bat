

Java 
rem please install openSSL firstly

openssl req -new -config justa999_wildCard_self_signed.cnf -keyout justa999_wildCard_self_signed.key -out justa999_wildCard_self_signed.csr

rem   This will create a 2048-bit RSA key pair, store the private key in the file justa999_wildCard_self_signed.key 
rem   and write the CSR to the file justa999_wildCard_self_signed.csr


rem To examine your CSR, use the following command (prints subject, public key and requested extensions, if present):
openssl req -in justa999_wildCard_self_signed.csr -noout -text -nameopt sep_multiline


rem creating the self-signed certificate
rem from https://serversforhackers.com/c/self-signed-ssl-certificates
openssl x509 -req -days 3650 -in "justa999_wildCard_self_signed.csr" -signkey "justa999_wildCard_self_signed.key"  -out "justa999_wildCard_self_signed.crt"