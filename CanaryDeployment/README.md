#  Canary  Startegy Deployment in Immutable Infrastructure 

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

### Step 1:

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
