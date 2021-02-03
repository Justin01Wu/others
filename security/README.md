# Security discuss

## Authorize mode
There are two type of authorize mode:

+ direct grant: is usually used in social media. End users manage permissions by themselves to decide who or which application can access their resources 
    + sample : users can grant another users or 3rd party application to access their Gmail or online photos.
+ delegation: is usually used in enterprise application, the application represents the permission for users, users info is in payload.
    + Sample : database access, AWS access
	+ user info in the payload: update contract set updatedBy=**1234** where contractId = 4567

The application  should use delegation mode, then we don’t have token renewal issue because it is not exposed to end user. 

## "as user" function 

"as user" function is designed for QA and DEV environment to simulate another user to test permission.

It is implemented in the application. But it is a bad place to implement in it because every front line application need this function for QA.

It should be implemented in authenticate center or a shared application.

	
## Grant type
It has three types of granting:
+ Authorization code grant: The authorization code grant is the preferred method for authorizing end users. 
    Instead of directly providing user pool tokens to an end user upon authentication, an authorization code is provided. 
	This code is then sent to a custom application that can exchange it for the desired tokens. Because the tokens are never exposed directly to an end user, they are less likely to become compromised.
+ Implicit grant: Only use the implicit grant when there’s a specific reason that the authorization code grant can’t be used.
    In an implicit grant, user pool tokens are exposed directly to the end user.
+ Client credentials grant: The client credentials grant is much more straightforward than the previous two grant types. 
    While the previous grants are intended to obtain tokens for end users, 
	the client credentials grant is typically intended to provide credentials to an application in order to authorize machine-to-machine requests.


	