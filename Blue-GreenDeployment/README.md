# Blue/Green Startegy Deployment in Immutable Infrastructure 
![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/ef9efec4-0688-4803-84b6-676aeb4e69db)

|   Author        |  Created on   |  Version   | Last updated by  | Last edited on |
| --------------- | --------------| -----------|----------------- | -------------- |
| **[Harshit Singh](https://github.com/Panu-S-Harshit-Ninja-07)**    | 05 April 2024 |  Version 1 | Harshit Singh     | 05 April 2024  |
***

## Table of Contents 

+ [Introduction](#Introduction)
+ [Pre-requisites](#Pre-requisites)
+ [Flow Diagram](#flow-diagram)
+ [Steps to Deploy](#steps-to-deploy-bluegreen-strategy)
+ [Result](#result)
+ [Conclusion](#Conclusion)
+ [Contact Information](#contact-information)
+ [References](#References)
***

## Introduction

[**Immutable infrastructure**](https://github.com/CodeOps-Hub/Documentation/blob/main/Infra/Manual/Infrastructure%20Types/Immutable%20Infrastructure/README.md) is a modern approach to managing IT environments that emphasizes the use of immutable components, where server instances, containers, or virtual machines are treated as disposable, immutable artifacts that are never modified after they are created.

In immutable infrastructure, updates and changes are applied by replacing entire server instances or components with new ones that incorporate the desired changes, rather than modifying existing instances in place.

The **blue-green deployment** strategy is a technique used in software deployment to ensure seamless updates with minimal downtime. It involves maintaining two identical production environments, labeled "blue" and "green," with only one actively serving user traffic at a time. This approach allows for testing and validation of updates in the green environment before routing traffic to it, providing a safety net for quick rollbacks if issues arise. By using this strategy, organizations can achieve continuous deployment while minimizing the risk of disruptions for end-users.

![Blue-Green GIF](https://www.encora.com/hs-fs/hubfs/blue-green-deployment.gif?width=540&name=blue-green-deployment.gif)

To know more about Blue-Green Deployment Strategy, [**click here**](https://github.com/CodeOps-Hub/Documentation/blob/main/Deployment_strategies/Blue_Green/README.md)
***
## Pre-requisites
| Service    | Description |
| ---------- | ----------- |
| AWS User   | an aws user with required permissions |
| AWS Enviroment | existing AWS Enviroment where deployment needs to be performed |
***

## Flow Diagram 
![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/06b44ea1-029d-475c-b24a-2535ba14d2bd)
***

## Steps to Deploy (Blue/Green Strategy)

### Step 1: Build a new version AMI 
Create and test a new AMI images with new version of application.

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/a48beedf-aeca-45a8-bddc-e68691b836b6)
***
### Step 2: Create a new Target group for version 2
![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/299a7c50-f830-4156-b5c0-b5545a0de77c)
***

### Step 3: Update Launch Template
Create a new AMI and new version of Launch Template that needs to be deployed with all requirements.

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/733d5647-f7f2-4a8e-b6d0-89e3df18519c)
***

### Step 4: Go to ASG and Create a new ASG 

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/a202f1da-075c-44f3-bff1-fb1554e59530)
***
### Step 5: Choose launch template
Give name of new ASG then, select launch template >> new version of application

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/ac5ccaf0-6d72-449e-a538-514b47d128a0)
***

### Step 6: Choose instance launch options 
Choose the VPC network environment that your instances are launched into, and customize the instance types and purchase options.

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/b3ad4ff5-35d1-4f5c-b70d-146d49d0cb3c)
***

### Step 7: Configure advanced options
Integrate your Auto Scaling group with other services to distribute network traffic across multiple servers using a load balancer.

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/f6c60c39-f355-47b8-895c-23c5674065d5)
***

### Step 8: Configure group size and scaling 
Define your group's desired capacity and scaling limits. You can optionally add automatic scaling to adjust the size of your group.

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/53220c16-5dd6-4c84-b7e1-7f9efa179bdf)
***
### Step 9: Add notifications (optional) 
Send notifications to SNS topics whenever Amazon EC2 Auto Scaling launches or terminates the EC2 instances in your Auto Scaling group.

### Step 10: Add tags
Add tags to help you search, filter, and track your Auto Scaling group across AWS. You can also choose to automatically add these tags to instances when they are launched.

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/5be8a1c3-9236-497e-9e9f-5b85e0c2ae91)
***
### Step 11: Review and create ASG
On the Review page, choose Create Auto Scaling group.
![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/66a627ec-c0af-4117-b13c-5a92318dcd6c)
***
### Step 12: Go to existing ALB 
Click on rules where v1 of application currently in use

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/afb6cd7a-9b5a-4b92-ae86-cd91dcf44b4c)
***
### Step 13: Select and edit the rule where old version of application TG is being used 
![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/15a2c544-f9ad-4386-8a53-a1400952828d)

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/358d7838-a697-4f0f-92be-1c55fc241529)

***
### Step 14: Define rule actions 
Here, select the new version TG
![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/ff7bc24c-420a-4cd1-a5f6-947bfd2b7ba0)
***

>[!NOTE]
> You should add new version TG and route your traffic gradually from old to new version.
 
## Result
![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/3de48c0e-de56-46cc-b98e-2e7bbbdb66ab)

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/45879e27-8dbe-41dc-ab5e-3c71ab9823e5)

***
## Conclusion
In conclusion, the blue-green deployment strategy offers significant advantages in terms of minimizing downtime, reducing deployment risks, and enabling continuous delivery of updates. However, it's essential to acknowledge the potential challenges such as increased infrastructure costs, complexity in managing dual environments, and dependency on automated deployment tools. Despite these drawbacks, when implemented effectively, blue-green deployments can enhance reliability, flexibility, and agility in the software delivery process. By understanding both the benefits and limitations, organizations can leverage the blue-green strategy to achieve seamless, efficient, and resilient deployment workflows.
***

## Contact Information

|     Name         | Email  |
| -----------------| ------------------------------------ |
| Harshit Singh    | harshit.singh.snaatak@mygurukulam.co |
***

## References

| Description                                   | References  
| --------------------------------------------  | -------------------------------------------------|
| Deployment Strategies Reference doc | https://github.com/CodeOps-Hub/Documentation/blob/main/Deployment_strategies/Blue_Green/README.md |
| Immutable Infrastructure Reference doc | https://github.com/CodeOps-Hub/Documentation/blob/main/Infra/Manual/Infrastructure%20Types/Immutable%20Infrastructure/README.md |
| Blue Green Strategy | https://docs.aws.amazon.com/whitepapers/latest/overview-deployment-options/bluegreen-deployments.html |
