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

### Step 2: Update Launch Template
Create a new AMI and new version of Launch Template that needs to be deployed with all requirements.

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/733d5647-f7f2-4a8e-b6d0-89e3df18519c)
***

### Step 3: Go to ASG and Create a new ASG 

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/a202f1da-075c-44f3-bff1-fb1554e59530)

### Step 4: Choose launch template
Give name of new ASG then, select launch template >> new version of application

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/ac5ccaf0-6d72-449e-a538-514b47d128a0)
***

### Step 5: Choose instance launch options 
Choose the VPC network environment that your instances are launched into, and customize the instance types and purchase options.

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/b3ad4ff5-35d1-4f5c-b70d-146d49d0cb3c)
***

### Step 6: Start instance refresh
Review all of your selections to confirm that everything is set up correctly.
When you are satisfied with your instance refresh selections, choose **Start instance refresh.**

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/c04a1060-f63e-4607-8968-36f2f35c66ba)

***
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
