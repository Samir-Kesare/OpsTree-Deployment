# Rolling Startegy Deployment in Immutable Infrastructure 
![image](https://github.com/CodeOps-Hub/Documentation/assets/156056444/de21aea5-4b4c-4416-b18c-0a68788cfcce)

|   Author        |  Created on   |  Version   | Last updated by  | Last edited on |
| --------------- | --------------| -----------|----------------- | -------------- |
| **[Harshit Singh](https://github.com/Panu-S-Harshit-Ninja-07)**    | 29 March 2024 |  Version 1 | Harshit Singh     | 29 March 2024  |
***

## Table of Contents 

+ [Introduction](#Introduction)
+ [Steps to Deploy](#steps-to-deploy-rolling-strategy)
+ [Advantages](#Advantages)
+ [Disadvantages](#Disadvantages)
+ [Conclusion](#Conclusion)
+ [Contact Information](#contact-information)
+ [References](#References)
***

## Introduction

[**Immutable infrastructure**](https://github.com/CodeOps-Hub/Documentation/blob/main/Infra/Manual/Infrastructure%20Types/Immutable%20Infrastructure/README.md) is a modern approach to managing IT environments that emphasizes the use of immutable components, where server instances, containers, or virtual machines are treated as disposable, immutable artifacts that are never modified after they are created.

In immutable infrastructure, updates and changes are applied by replacing entire server instances or components with new ones that incorporate the desired changes, rather than modifying existing instances in place.

A rolling deployment strategy is a method used in software deployment where updates or changes are gradually applied to a subset of servers or instances in a systematic and controlled manner, while the remaining servers continue to handle production traffic. This approach ensures continuous availability of the application and reduces the risk associated with deploying changes.

![image](https://github.com/CodeOps-Hub/Documentation/assets/156056444/ddf2dbea-9e4e-413c-83f1-2323ce5133e0)

In a rolling deployment:

1. **Gradual Updates**: Updates are applied incrementally to a small portion of the infrastructure, such as one server or a group of servers, at a time.

2. **Continuous Availability**: Throughout the deployment process, the application remains available to users as the updates are rolled out without causing downtime.

3. **Fault Isolation**: By updating only a subset of servers at any given time, the impact of any potential issues or bugs is limited to a small portion of the infrastructure.

4. **Easy Rollback**: If any problems occur during the deployment, it's relatively straightforward to roll back to the previous version since only a fraction of the infrastructure has been updated.

5. **Automated Orchestration**: Rolling deployments are often automated using deployment orchestration tools or continuous integration/continuous deployment (CI/CD) pipelines to manage the process efficiently.

To know more about Rolling Strategy, [**click here**](https://github.com/CodeOps-Hub/Documentation/tree/main/Deployment_strategies/Rolling)
***

## Instance Refresh 
We will use instance refresh to update the instances in your Auto Scaling group. This feature can be useful when a configuration change requires to replace instances, especially if Auto Scaling group contains a large number of instances.

When the instance refresh has started, Amazon EC2 Auto Scaling will:

- Replace instances in batches based on the minimum and maximum healthy percentages.
- Launch the new instances first before terminating the old ones if the minimum healthy percentage is set to 100 percent. This ensures that desired capacity is maintained at all times.
- Check instances for health status and give them time to warm up before more instances are replaced.
- Terminate and replace instances that are found to be unhealthy.
- Automatically update the Auto Scaling group settings with the new configuration changes after the instance refresh succeeds.

The following flow diagram illustrates the launch before terminate behavior when you set the minimum healthy percentage to 100 percent.

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/1e247890-ade7-4d8b-8536-9504070b26fc)
***

## Pre-requisites
| Service    | Description |
| ---------- | ----------- |
| AWS User   | an aws user with required permissions |
| AWS Enviroment | existing AWS Enviroment where deployment needs to be performed |
***

## How it Works?
![image](https://github.com/CodeOps-Hub/Documentation/assets/156056444/8f9a29c6-0ef5-4b9c-b485-5ba6efc4a015)
***

## Steps to Deploy (Rolling Strategy)

### Step 1: Build a new AMI 
Create and test a new AMI images with new version of application.

![image](https://github.com/CodeOps-Hub/Deployment/assets/156056444/6db566eb-6d1b-4fb1-b068-674b4af315f4)

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

## Conclusion
Rolling out immutable infrastructure using a rolling deployment strategy offers numerous advantages, including continuous availability, risk mitigation, and scalability. However, it comes with challenges such as increased complexity, resource intensity, and potential service degradation. Despite these drawbacks, proper orchestration and adherence to best practices can ensure successful deployment and maintenance of a robust and reliable infrastructure.
***

## Contact Information

|     Name         | Email  |
| -----------------| ------------------------------------ |
| Harshit Singh    | harshit.singh.snaatak@mygurukulam.co |
***

## References

| Description                                   | References  
| --------------------------------------------  | -------------------------------------------------|
| Deployment Strategies Reference doc | https://github.com/CodeOps-Hub/Documentation/tree/main/Deployment_strategies/Rolling |
| Immutable Infrastructure Reference doc | https://github.com/CodeOps-Hub/Documentation/blob/main/Infra/Manual/Infrastructure%20Types/Immutable%20Infrastructure/README.md |
| How to Rollout | https://medium.com/@maheshwar.ramkrushna/chap-22-rollout-strategies-in-kubernetes-rolling-update-with-nginx-7b539e03495a |
