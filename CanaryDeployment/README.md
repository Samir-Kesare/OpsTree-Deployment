# Canary  Startegy Deployment in Immutable Infrastructure 

<p align="center">
   <img src="https://storage.googleapis.com/cdn.thenewstack.io/media/2017/11/a6324354-canary.gif" width="400px">
</p>
 
| **Author** | **Created On** | **Last Updated** | **Document version** |
| ---------- | -------------- | ---------------- | -------------------- |
| **Vishal Kumar Kesharwani** | **05 April 2024** | **05 APril 2024** | **v1** |

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

<img width="360" length="100" src="https://github.com/CodeOps-Hub/Documentation/assets/156056413/7d9b407e-4c14-4e82-8bb9-84d1b2a96546">

The canary deployment method sends out application updates in an incremental fashion. It starts with a small badge of users and continues the rollout until you reach 100% deployment. This is the least risky deployment strategy as it allows teams to test live updates on small groups of users before pushing them out in larger badges. 

It’s also more effective because you conduct tests on the live version instead of staged environments. Rollbacks are fast, and there’s no downtime in this case.


To know more about  Canary  Deployment Strategy, [**click here**](https://github.com/CodeOps-Hub/Documentation/blob/main/Deployment_strategies/Canary/README.md)

***

## Pre-requisites
| Service    | Description |
| ---------- | ----------- |
| AWS User   | an aws user with required permissions |
| AWS Enviroment | existing AWS Enviroment where deployment needs to be performed |

***

## Flow Diagram 

Canary deployment involves deploying a new version of an application to a separate environment while directing only a small portion of traffic to it initially. This allows for gradual testing and monitoring of the new version's performance. Various strategies, such as distributing requests evenly or selecting beta testers, can determine which traffic accesses the new version first. Continuous monitoring of metrics helps decide whether to increase traffic or rollback. Once validated, all traffic is routed to the new version, and the old environment can be terminated gracefully. This approach reduces the impact of potential failures and promotes confidence in adopting Continuous Deployment practices.

<img src="https://blog.qburst.com/wp-content/uploads/2023/09/Canary-Deployment-Stategy.gif" width="600px">


***

## Steps to Deploy ( Canary  Strategy)

### Step 1: Build a new version AMI 

Create and test a new AMI images with new version of application.

<img src="https://github.com/CodeOps-Hub/Deployment/assets/156056413/1bdf6876-9725-4698-a7c4-449ccc2a7a09" width="800px">

***

### Step 2: Create a new Target group for version 2

<img src="https://github.com/CodeOps-Hub/Deployment/assets/156056413/ad33b17a-1a28-4542-97d7-7f26b10419d3" width="800px">

***

### Step 3: Update Launch Template

Create a new AMI and new version of Launch Template that needs to be deployed with all requirements.

<img src="https://github.com/CodeOps-Hub/Deployment/assets/156056413/411cb2c6-55d7-495b-b0e9-ae80543bb128" width="800px">

***

### Step 4: Go to ASG and Create a new ASG 

<img src="https://github.com/CodeOps-Hub/Deployment/assets/156056413/103a20d0-e6fe-4ab7-9cab-eb63e7b06046" width="800px">

***

### Step 5: Choose launch template

Give name of new ASG then, select launch template >> new version of application

<img src="https://github.com/CodeOps-Hub/Deployment/assets/156056413/38c5ad57-85ab-4e06-abff-a2e6c88cf70e" width="800px">

***

### Step 6: Choose instance launch options 

Choose the VPC network environment that your instances are launched into, and customize the instance types and purchase options.

<img src="https://github.com/CodeOps-Hub/Deployment/assets/156056413/5705dff4-6793-43b3-a37a-b75f4959afb5" width="800p">

***

### Step 7: Configure advanced options

Integrate your Auto Scaling group with other services to distribute network traffic across multiple servers using a load balancer.

<img src="https://github.com/CodeOps-Hub/Deployment/assets/156056413/50fbd036-e34e-4410-9f26-ceac51acf2b6" width="800p">

***

### Step 8: Configure group size and scaling 

Define your group's desired capacity and scaling limits. You can optionally add automatic scaling to adjust the size of your group.

<img src="https://github.com/CodeOps-Hub/Deployment/assets/156056413/611d2842-97ac-479d-8e29-9d0b30efc6c6" width="800p">

***

### Step 9: Add notifications (optional) 

Send notifications to SNS topics whenever Amazon EC2 Auto Scaling launches or terminates the EC2 instances in your Auto Scaling group.

### Step 10: Add tags

Add tags to help you search, filter, and track your Auto Scaling group across AWS. You can also choose to automatically add these tags to instances when they are launched.

<img src="https://github.com/CodeOps-Hub/Deployment/assets/156056413/64a733e8-27d9-41f6-a890-42528aff2c48" width="800p">

***

### Step 11: Review and create ASG

On the Review page, choose Create Auto Scaling group.

<img src="https://github.com/CodeOps-Hub/Deployment/assets/156056413/01424a0b-9063-4765-878c-ce18b55016b1" width="800p">

***

### Step 12: Go to existing ALB 

Click on rules where v1 of application currently in use

<img src="https://github.com/CodeOps-Hub/Deployment/assets/156056413/d7ca4e9f-c2d8-440a-ba1e-e200ab303f8e" width="800p">

***

### Step 13: Select and edit the rule where old version of application TG is being used 

<img src="https://github.com/CodeOps-Hub/Deployment/assets/156056413/6d3c9e9a-0d4f-4c87-960a-ee99ef5dbc9e" width="800p">

<img src="https://github.com/CodeOps-Hub/Deployment/assets/156056413/3bd64c3c-29ba-4214-b0e5-e7ec7ceb4bd5" width="800p">

***

### Step 14: Define rule actions 

Click on add new target  group and select the v2 target  Group. 
Then, define the  % of traffic that  will be routed towards v1 and v2 Target  Group .

<img src="https://github.com/CodeOps-Hub/Deployment/assets/156056413/7402504b-86a3-4c5e-a450-a49d2c2a56c7" width="800p">

Review changes and save changes.

<img src="https://github.com/CodeOps-Hub/Deployment/assets/156056413/87999793-761a-4880-bb72-50b2ad2f4f18" width="800p">

***

>[!NOTE]
> Now, we will gradually transfer traffic from v1 TG to v2 TG
 
### Step 15: Edit rule action

As you gain more confidence in the new version, you can start releasing it to more servers in your infrastructure and routing more users to it.

<img src="https://github.com/CodeOps-Hub/Deployment/assets/156056413/a34ab94f-3d79-483e-adea-89e8a67f0797" width="800p">

Review changes and save changes.

<img src="https://github.com/CodeOps-Hub/Deployment/assets/156056413/e21ec3cb-c563-411c-a37e-6ff55097b952" width="800p">

<img src="https://github.com/CodeOps-Hub/Deployment/assets/156056413/51775b02-e2bd-4eb6-9e80-55eff97b72c4" width="800p">

***

## Result

**V1**

<img src="https://github.com/CodeOps-Hub/Deployment/assets/156056444/3de48c0e-de56-46cc-b98e-2e7bbbdb66ab" width="800p">

**V2**

<img src="https://github.com/CodeOps-Hub/Deployment/assets/156056444/45879e27-8dbe-41dc-ab5e-3c71ab9823e5" width="800p">

***

## Conclusion

Canary deployments offer a controlled and incremental approach to updating applications, reducing risks by testing updates on a small subset of users or servers before full deployment. Despite potential complexities and resource usage, the method provides early feedback, improves reliability, and enables a smoother rollout. By following best practices such as starting small, automating testing, and maintaining clear communication, teams can effectively manage Canary deployments, ensuring successful updates with minimal disruption.

***

## Contact Information

| **Name** | **Email Address** |
| -------- | ----------------- |
| **Vishal Kumar Kesharwani** | vishal.kumar.kesharwani.snaatak@mygurukulam.co |

***

## References

| Description                                   | References  
| --------------------------------------------  | -------------------------------------------------|
| Deployment Strategies Reference doc | [**Link**](https://github.com/CodeOps-Hub/Documentation/blob/main/Deployment_strategies/Canary/README.md) |
| Immutable Infrastructure Reference doc | [**Link**](https://github.com/CodeOps-Hub/Documentation/blob/main/Infra/Manual/Infrastructure%20Types/Immutable%20Infrastructure/README.md) |
