# Security discuss

## Authorize mode
It has two type of authorize mode:

+ direct grant: usually used in social media. Users manage their permission by themselves to decide who can access their resources 
    + sample : users can grant another users or 3rd party application to access their Gmail or online photos.
+ delegation: usually used in enterprise application, the application represents the permission for users, users info is in payload.
    + Sample : database access, AWS access

Wrong authority mode in the application: should use delegations. 
We don’t have token renewal issue because it is not exposed to end user. 

## "as user" function 
"as user" function is designed for QA and DEV environment to simulate another user to test permission 

As user issues: this is implemented in the application. 

But it is a bad place to implement in it. 

It should be implemented in authenticate center because every front line application need this function for QA.
	
