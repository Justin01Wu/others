# AWS Learning

## S3
- An S3 object ACL is the only way to manage access to objects which are not owned by the bucket owner. 
  An AWS account that owns the bucket can grant another AWS account permission to upload objects.

### Bucket name dot issue  
WildCast SSL certificate can only support one level sub-domain: 
    [Wildcard_certificate](https://en.wikipedia.org/wiki/Wildcard_certificate) 

like *.google.com support www.google.com , but api. www.google.com will fail.
So when you create a bucket with a dot in it, it will fail because dot will let browse think it has
two level sub domain : 
```xml
  https:// bucket.name .s3.amazon.com/key  
```

So in this case, you can move bucket into the key name: 
```xml
  https://s3.amazon.com/ bucket.name/key
```

The second style is called path-style URL, first one is called virtual hosted-style URL
Usually AWS SDK and console can automatically handle this issue. But you need to switch the
UTL style if you directly access URL.

### Region
Us-east (N. Virginia) is the default S3 region, it doesn’t need region name is the URL: https://s3.amazonaws.com/justa.ca/Ec2WinJoinAD.png
Other regions need region in the URL:
https://s3-ap-southeast-1.amazonaws.com/justa.cn/CF_nested.png

## EC2
- After the user has assigned a secondary private IP address to his instance, he needs to configure the operating system on that instance to recognize the secondary private IP address. 
  For AWS Linux, the ec2-net-utils package can take care of this step.
- When a user creates an EBS volume and attaches it as a device, it is required to mount the device.
- If an EBS volume is attached to a running EC2 instance, the user needs to detach the volume from the original instance and then attach it to a new running instance. 
  The user doesn't need to stop / terminate the original instance.

### EBS
- EBS volumes are created in a specific Availability Zone, and can then be attached to any instances in that same Availability Zone.
- Amazon EBS volumes are designed to be highly available and reliable. 
  At no additional charge to you, Amazon EBS volume data is replicated across multiple servers in an Availability Zone to prevent the loss of data from the failure of any single component. 

## Security
- The IAM users by default cannot change their password. The root owner or IAM administrator needs to set the policy in the password policy page, which should allow the user to change their password.
- The statement is the main element of the IAM policy and it is a must for a policy. <img src="aws/Aws_permissionPolicy.png">
- The root user can customize login url <img src="aws/customized_sign-in_Link.png">
- It is a recommended rule that the root user should grant the least privileges to the IAM user or the group. The higher the privileges, the more problems it can create.
- The only recommended use case for the bucket ACL is to grant write permission to the Amazon S3 Log Delivery group to write access log objects to your bucket.
   Please see [here](https://docs.aws.amazon.com/AmazonS3/latest/dev/access-policy-alternatives-guidelines.html)

### With regard to IAM, when a request is made, the AWS service decides whether a given request should be allowed or denied. 
The evaluation logic follows these rules:
- By default, all requests are denied. (In general, requests made using the account credentials for resources in the account are always allowed.)
- An explicit allow policy overrides this default.
- An explicit deny policy overrides any allows.

## DB
- Amazon RDS provides two different methods for backing up and restoring the Amazon DB instances. 
  A brief I/O freeze, typically lasting a few seconds, occurs during both automated backups and DB snapshot operations on Single-AZ DB instances.
  
### DynamoDb
- DynamoDb use the stream to trigger a lambda function<img src="aws/dynamo_stream.png">
- DynamoDb supports conditional update (first wins for strict banking application ) and atomic counter(last wins)
- DynamoDB uses optimistic concurrency control 
- DynamoDB uses conditional writes for consistency

## Message
- Queue names are limited to 80 characters. Alphanumeric characters plus hyphens (-) and underscores (_) are allowed. Queue names must be unique within an AWS account
- AWS reserve the right to delete a queue if no activity against the queue for more than 30 consecutive days
- Amazon SQS is engineered to provide "at least once" delivery of all messages in its queues. Although most of the time, each message will be delivered to your application exactly once.
  You should design your system so that processing a message more than once does not create any errors or inconsistencies.
- Amazon SQS makes a best effort to preserve order in messages, but due to the distributed nature of the queue, AWS cannot guarantee that you will receive messages in the exact order you sent them. 
- You typically place sequencing information or timestamps in your messages so that you can reorder them upon receipt.
- A message can be stored in the Simple Queue Service (SQS) from 1 minute up to a maximum of 14 days. Thde fault is 4 days.
- With Amazon SQS version 2008-01-01, the maximum message size for both SOAP and Query requests is 8KB.
- By default, SQS queues allow you to send the largest supported payload size, currently 256KB.

## VPC
### Multiple interfaces
If you need to host multiple websites(with different IPs) on a single EC2 instance, the following is the suggested method from AWS:
- Launch a VPC instance with two network interfaces
- Assign elastic IPs from VPC EIP pool to those interfaces (Because, when the user has attached more than one network interface with an instance, AWS cannot assign public IPs to them)
- Assign separate Security Groups if separate Security Groups are needed
This scenario also helps for operating network appliances, such as firewalls or load balancers that have multiple private IP addresses for each network interface.

## High Availability
- The Manual Scaling as part of Auto Scaling allows the user to change the capacity of Auto Scaling group. 
  The user can add / remove EC2 instances on the fly. To execute manual scaling, the user should modify the desired capacity. 
  AutoScaling will adjust instances as per the requirements.
  
### The AWS ELB allows mapping a custom domain name with ELB. The user can map ELB with DNS in two ways:
- By creating CNAME with the existing domain name service provide
- OR by creating a record with Route 53

## SWF
- Amazon SWF consists of a number of different types of programmatic features known as actors. Actors can be workflow starters, deciders, or activity workers.
- These actors communicate with Amazon SWF through its API. You can develop actors in any programming language.
- In Amazon Simple Workflow Service (Amazon SWF), an activity worker is a program that receives activity tasks, performs them, and provides results back.
- At times, you might want to record information in the workflow history of a workflow execution that is specific to your use case. 
  Markers enable you to record information in the workflow execution history that you can use for any custom or scenario-specific purpose.

## CloudWatch
- Application can easily create customized metrics in CloudWatch
<img src="aws/CloudWatch_customizedMetrics.png">

## Infrastructure as Code
- Maximum number of AWS CloudFormation stacks that you can create is 20 stacks.

## Deployment

Deployment Strategies:
- All-at-once
- In-place
- Rolling
- Rolling with additional batch
- Blue/Green and Immutable

To deploy a bundle to an ec2 instance, you need :
- Set ec2 instance with a tag which match key value in the deployment group
- Install the codeDeploy agent on the ec2 instance(didn’t mention in the official guide)
- Create an appsecs.yml to include actions for installation and put this file on the top of your zip file
- Copy this zip file to s3 bucket and set your deployment source to it
The official guide book missed the agent step

## Developing
- aws explorer is an Eclipse plugin <img src="aws/aws explorer.png">
- You can set environment variable for acess key <img src="aws/setEnvironment.png">, which override config file




