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

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/e633e9d5-1639-41d2-bfe9-6989b4348d84)

### Step 3: Go to ASG(here it is Frontend-ASG) and Start Instance Refresh 

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/4d7e1fa5-00c5-49ab-8d0c-c6da488e14b8)

### Step 4: For Availability settings, do the following:

A. Choose one of the following instance replacement methods:

  1. **Launch before terminating:** A new instance must be provisioned first before an existing instance can be terminated. This is a good choice for applications that favor availability over cost savings.
  2. **Terminate and launch:** New instances are provisioned at the same time your existing instances are terminated. This is a good choice for applications that favor cost savings over availability. It's also a good choice for applications that should not launch more capacity than is currently available.
  3. **Custom behavior:** This option lets you set up a custom minimum and maximum range for the amount of capacity that you want available when replacing instances. This can help you achieve the right balance between cost and availability.

B. For **Set healthy percentage**, enter values for one or both of the following fields. The enable fields vary depending on the option you choose for **Instance replacement method**.

  1. **Min:** Sets the minimum healthy percentage that's required to proceed with the instance refresh.
  2. **Max:** Sets the maximum healthy percentage that's possible during the instance refresh. 

c. For **Instance warmup**, enter the number of seconds from when a new instance's state changes to `InService` to when it finishes initializing. Amazon EC2 Auto Scaling waits this amount of time before moving on to replace the next instance.

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/8ecdaa43-a258-406c-8be6-d6d7c14f9417)

### Step 5: Desired configuration
Expand the **Desired configuration** section to specify updates that you want to make to your Auto Scaling group.

- For **Update launch template**:
If you created a new launch template or a new launch template version, select this check box. When you select this option, Amazon EC2 Auto Scaling shows you the current launch template and current launch template version. It also lists any other available versions. Choose the launch template and then choose the version.

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/ce70956d-1a99-4904-8959-cd7190cf040d)

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
