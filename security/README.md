# Security discuss

## Authorize mode
There are two type of authorize mode:

+ direct grant: is usually used in social media. End users manage permissions by themselves to decide who or which application can access their resources 
    + sample : users can grant another users or 3rd party application to access their Gmail or online photos.
+ delegation: is usually used in enterprise application, the application represents the permission for users, users info is in payload.
    + Sample : database access, AWS access
	+ user info in the payload: update contract set updatedBy=1234 where contractId = 4567

Wrong authority mode in the application: should use delegations. 
We don’t have token renewal issue because it is not exposed to end user. 

## "as user" function 

"as user" function is designed for QA and DEV environment to simulate another user to test permission.

It is implemented in the application. But it is a bad place to implement in it because every front line application need this function for QA.

It should be implemented in authenticate center or a shared application.

	
