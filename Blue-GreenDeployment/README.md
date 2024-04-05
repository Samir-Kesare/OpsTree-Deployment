# Rolling Startegy Deployment in Immutable Infrastructure 
![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/ef9efec4-0688-4803-84b6-676aeb4e69db)

|   Author        |  Created on   |  Version   | Last updated by  | Last edited on |
| --------------- | --------------| -----------|----------------- | -------------- |
| **[Harshit Singh](https://github.com/Panu-S-Harshit-Ninja-07)**    | 05 April 2024 |  Version 1 | Harshit Singh     | 05 April 2024  |
***

## Table of Contents 

+ [Introduction](#Introduction)
+ [Instance Refresh](#Instance-Refresh)
+ [Pre-requisites](#Pre-requisites)
+ [How it Works?](#How-it-Works)
+ [Steps to Deploy](#steps-to-deploy-rolling-strategy)
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

## Flow Diagram 

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/1e247890-ade7-4d8b-8536-9504070b26fc)
***

## Pre-requisites
| Service    | Description |
| ---------- | ----------- |
| AWS User   | an aws user with required permissions |
| AWS Enviroment | existing AWS Enviroment where deployment needs to be performed |
***

## How it Works?
![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/8279813b-4f6b-4cdd-9eef-7ffe60dee5a6)

***

## Steps to Deploy (Rolling Strategy)

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
### Step 12: 
## Result
![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/63083e7c-09d7-40c4-8a9e-87ad3cc2e790)

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/0029db10-c5df-4335-b881-cd17318b3f4d)

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/2feba7a4-9093-4416-96e7-830fc8a896db)

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/3f00c546-8109-4ad0-a3f6-b50f2e460d07)

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/73370356-c20d-45bd-a40a-30400e53e420)
***
## Conclusion
Rolling out immutable infrastructure using a rolling deployment strategy offers numerous advantages, including continuous availability, risk mitigation, and scalability. However, it comes with challenges such as increased complexity, resource intensity, and potential service degradation. Despite these drawbacks, proper orchestration and adherence to best practices can ensure successful deployment and maintenance of a robust and reliable infrastructure.
***

## Contact Information

|     Name         | Email  |
| -----------------| ------------------------------------ |
| Harshit Singh    | harshit.singh.snaatak@mygurukulam.co |
***

## References

| Description                                   | References  |
| --------------------------------------------  | -------------------------------------------------|
| Rollout Immutable Infrastructure using Rolling Startegy | [Reference link](https://github.com/CodeOps-Hub/Documentation/blob/main/Infra/Manual/Infrastructure%20Types/Immutable%20Infrastructure/Rollout/rollingStrategy/README.md) |
| Deployment Strategies Reference doc | [Reference link](https://github.com/CodeOps-Hub/Documentation/tree/main/Deployment_strategies/Rolling) |
| Immutable Infrastructure Reference doc | [Reference link](https://github.com/CodeOps-Hub/Documentation/blob/main/Infra/Manual/Infrastructure%20Types/Immutable%20Infrastructure/README.md) |
| How to Rollout | [Reference link](https://medium.com/@maheshwar.ramkrushna/chap-22-rollout-strategies-in-kubernetes-rolling-update-with-nginx-7b539e03495a) |
