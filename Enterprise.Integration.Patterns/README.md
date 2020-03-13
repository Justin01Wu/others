# Summary on the book Enterprise Integration Patterns

Interesting applications rarely live in isolation.

## Challenges

All integration solutions have to deal with a few fundamental challenges:
+ Networks are unreliable
+ Networks are slow
+ Any two applications are different
+ Change is inevitable

## approaches

Over time, developers have overcome these challenges with four main approaches:
+ File Transfer:  import, export
+ Shared Database
+ Remote Procedure Invocation: RPC, RMI, API, CORBA, COM, SOAP 
+ Messaging

Messaging is a technology that enables high-speed, asynchronous, program-to-program communication with reliable delivery.

## Criteria

The following are some main decision criteria.
+ whether to use application integration at all
+ Application coupling
+ Intrusiveness
+ Technology selection
+ Data format
+ Data timeliness
+ Data or functionality
+ Remote Communication
+ Reliability

Features of each:
+ File Transfer:
	+ well decoupled
	+ Integrators need no knowledge of the internals of an application
	+ The file's contents and format are negotiated with integrators
	+ no extra tools or integration packages are needed
	+ developers have to do a lot of the work themselves
	+ lack timeliness: staleness of the data, developers must deal with data that isn't quite right
	+ No distance restriction
+ Shared Database
	+ Solve semantic dissonance issue early, avoid later disaster	
	+ Unified schema is hard to design: technical difficulties and political difficulties
	+ No stale data
	+ Hard to add adopter
	+ Performance bottleneck, deadlocks 
	+ Network or Distributing challenges for wide-area  
+ Remote Procedure Invocation: 
	+ encapsulation helps reduce the coupling of the applications
	+ applications are still fairly tightly coupled together.
	+ share functionality, others only share data
	+ each application has to negotiate its interface with its neighbors
	+ less learning curve for developers
	+ Network challenges for wide-area  
	
+ Messaging