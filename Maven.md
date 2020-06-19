# EveryThing about maven

## tips
+ Your company may block maven central repo because the SSL certificate is almost expired :
    sun.security.validator.ValidatorException: 
	PKIX path building failed: 
	sun.security.provider.certpath.SunCertPathBuilderException: 
	unable to find valid certification path to requested target
    <img src="blockedMvenDownload.png">	
+ You can temporarily use HTTP to avoid this issue:	
https://stackoverflow.com/questions/25911623/problems-using-maven-and-ssl-behind-proxy
+ When you have to copy artifact from another computer, we have to delete this file :
    _remote.repositories
	otherwise it will complain: Could not find artifact even it is there


	