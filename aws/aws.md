# AWS Learning


## EC2
- After the user has assigned a secondary private IP address to his instance, he needs to configure the operating system on that instance to recognize the secondary private IP address. For AWS Linux, the ec2-net-utils package can take care of this step.
- When a user creates an EBS volume and attaches it as a device, it is required to mount the device.

### EBS
- EBS volumes are created in a specific Availability Zone, and can then be attached to any instances in that same Availability Zone.
- Amazon EBS volumes are designed to be highly available and reliable. At no additional charge to you, Amazon EBS volume data is replicated across multiple servers in an Availability Zone to prevent the loss of data from the failure of any single component. 

## Security
- The IAM users by default cannot change their password. The root owner or IAM administrator needs to set the policy in the password policy page, which should allow the user to change their password.
- The statement is the main element of the IAM policy and it is a must for a policy.
<img src="aws/Aws_permissionPolicy.png">
## Message
- Queue names are limited to 80 characters. Alphanumeric characters plus hyphens (-) and underscores (_) are allowed. Queue names must be unique within an AWS account
- AWS reserve the right to delete a queue if no activity against the queue for more than 30 consecutive days

## VPC
### multiple interfaces
If you need to host multiple websites(with different IPs) on a single EC2 instance, the following is the suggested method from AWS:
- Launch a VPC instance with two network interfaces
- Assign elastic IPs from VPC EIP pool to those interfaces (Because, when the user has attached more than one network interface with an instance, AWS cannot assign public IPs to them)
- Assign separate Security Groups if separate Security Groups are needed
This scenario also helps for operating network appliances, such as firewalls or load balancers that have multiple private IP addresses for each network interface.

## SWF
- Amazon SWF consists of a number of different types of programmatic features known as actors. Actors can be workflow starters, deciders, or activity workers.
- These actors communicate with Amazon SWF through its API. You can develop actors in any programming language.




