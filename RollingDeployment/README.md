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
You can use an instance refresh to update the instances in your Auto Scaling group. This feature can be useful when a configuration change requires you to replace instances, especially if your Auto Scaling group contains a large number of instances.

When the instance refresh has started, Amazon EC2 Auto Scaling will:

- Replace instances in batches based on the minimum and maximum healthy percentages.
- Launch the new instances first before terminating the old ones if the minimum healthy percentage is set to 100 percent. This ensures that your desired capacity is maintained at all times.
- Check instances for health status and give them time to warm up before more instances are replaced.
- Terminate and replace instances that are found to be unhealthy.
- Automatically update the Auto Scaling group settings with the new configuration changes after the instance refresh succeeds.
- The following flow diagram illustrates the launch before terminate behavior when you set the minimum healthy percentage to 100 percent.

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

Rolling out immutable infrastructure using a rolling deployment strategy involves deploying updates or changes to your infrastructure in a phased manner while maintaining high availability and minimizing downtime. Here's a general outline of how you could approach it:

## Step 1: Build a new AMI 
Create and test a new AMI images with new version of application.

## Step 2: Update Launch Template
Create a new AMI and new version of Launch Template that needs to be deployed with all requirements.

## Step 3: Go to ASG(here it is Frontend-ASG) and Start Instance Refresh 

## Step 4: For Availability settings, do the following:

i. Choose one of the following instance replacement methods:

  1. **Launch before terminating:** A new instance must be provisioned first before an existing instance can be terminated. This is a good choice for applications that favor availability over cost savings.
  2. **Terminate and launch:** New instances are provisioned at the same time your existing instances are terminated. This is a good choice for applications that favor cost savings over availability. It's also a good choice for applications that should not launch more capacity than is currently available.
  3. **Custom behavior:** This option lets you set up a custom minimum and maximum range for the amount of capacity that you want available when replacing instances. This can help you achieve the right balance between cost and availability.

ii. For Set healthy percentage, enter values for one or both of the following fields. The enable fields vary depending on the option you choose for Instance replacement method.

  1. **Min:** Sets the minimum healthy percentage that's required to proceed with the instance refresh.
  2. **Max:** Sets the maximum healthy percentage that's possible during the instance refresh. 
## Step 5: Configure Instance Refresh

Set up a blue-green deployment environment where you have two identical production environments: one currently serving traffic (blue), and the other ready to receive updates (green).



**Step 6: Gradual Rollout**

Start by deploying the new immutable images to the green environment. This could be done gradually, for example, by rolling out updates to a small subset of servers or instances first to ensure everything is working as expected.

**Step 7: Health Checks and Monitoring**

Implement health checks and monitoring to ensure that the new green environment is functioning correctly. This could include automated tests, system health checks, and performance monitoring.

**Step 8: Traffic Shifting**

Once you're confident that the green environment is stable and performing well, gradually shift traffic from the blue environment to the green environment. This could be done using load balancer settings or DNS changes.

**Step 9: Rollback Plan**

Have a rollback plan in place in case any issues arise during the deployment. This could involve automatically shifting traffic back to the blue environment or rolling back to a previous version of the immutable images.

**Step 9: Post-Deployment Verification**

After the deployment is complete, perform thorough post-deployment verification to ensure that everything is working as expected in the green environment.

**Step 10: Cleanup**

Once the deployment is successful and you're confident in the new green environment, clean up any resources associated with the blue environment to avoid unnecessary costs and complexity.
***

## Advantages

| Advantage                  | Description                                                                                                                                                      |
|----------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Continuous Availability    | Rolling deployments ensure that your application remains available throughout the deployment process, minimizing downtime and maintaining service continuity.   |
| Risk Mitigation            | Reduces the risk of deploying faulty updates by gradually updating a subset of instances, allowing for the detection and resolution of issues before affecting the entire infrastructure. |
| Incremental Updates        | Enables the deployment of updates incrementally, facilitating the management of large-scale deployments and reducing the impact on system resources.              |
| Easier Rollbacks           | Facilitates quick rollbacks to previous versions in case of issues, as changes are applied gradually, allowing for the identification and resolution of problems without disrupting the entire system. |
| Scalability                | Provides scalability by allowing the rate of updates to be adjusted based on demand, ensuring that the infrastructure can handle changes without sacrificing performance or stability. |
| Consistency                | Helps maintain consistency across the infrastructure by updating instances in a phased manner, ensuring that all instances run the same version of the application and reducing the risk of compatibility issues. |
***

## Disadvantages
Here's the information presented in a table format:

| Disadvantage              | Description |
|---------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Increased Complexity     | Implementing rolling deployments requires careful orchestration and coordination, adding complexity to the deployment process. |
| Resource Intensive        | Rolling deployments may require additional resources such as extra server capacity or automation tools, increasing operational costs and resource consumption. |
| Extended Deployment Time | Rolling deployments may take longer to complete compared to other deployment strategies due to incremental updates applied to a subset of servers. |
| Potential Service Degradation | There is a risk of service degradation if updated code introduces unexpected bugs or performance issues, impacting a subset of users or transactions. |
| Version Drift            | Managing version consistency across a large number of servers can be challenging, leading to version drift and potential compatibility issues. |
| Dependency Management    | Handling dependencies between different components of the application stack can be complex and may require additional testing and validation. |
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
