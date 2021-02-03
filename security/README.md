# Security discuss

## Authorize mode
It has two type of authorize mode:

+ direct grant: usually used in social media. Users manage their permission by themselves to decide who can access their resources 
    + sample : users can grant another users or 3rd party application to access their gmail or online photos.
+ delegation: usually used in enterprise application, the application represents the permission for users, users info is in payload.
    + Sample : db access, AWS access

Wrong authority mode in the application: should use delegations. 
We don’t have token renewal issue because it is not exposed to end user. 

## "as user" function 
"as user" function is degined for QA and DEV env to simulate another user to test permission 

As user issues: this is implemented in the application. 

But it is a bad place to implement in it. 

It should be implemented in auth center because every front line application need this function for QA.


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


	