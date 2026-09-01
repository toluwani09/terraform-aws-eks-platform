# Terraform AWS EKS Platform

<div align="center">

### Infrastructure as Code | AWS | Terraform | Amazon EKS

![Terraform](https://img.shields.io/badge/Terraform-Infrastructure%20as%20Code-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-Cloud-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-EKS-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-Repository-181717?style=for-the-badge&logo=github&logoColor=white)

</div>

---
## Project Overview

I designed and implemented this project to provision an Amazon EKS platform on AWS using Terraform.

The primary focus of the project is infrastructure provisioning through Infrastructure as Code, with emphasis on reusable Terraform modules, environment separation, remote state management, AWS networking, IAM, and Amazon EKS.

Rather than defining the entire infrastructure in a single Terraform configuration, I separated the implementation into reusable modules for the VPC, IAM, and EKS components. I then used separate environment configurations for development, staging, and production to provide environment-specific values while reusing the same underlying infrastructure modules.

The project also includes a dedicated bootstrap configuration for provisioning the AWS resources required for Terraform remote state management.

The development environment was provisioned and verified successfully on AWS. The staging and production directories contain their respective Terraform configurations and are structured to consume the same reusable modules.

## Engineering Objectives

The project was built around the following objectives.

# 1. Infrastructure as Code

I used Terraform to define the AWS infrastructure declaratively rather than creating the resources manually through the AWS Management Console.

This makes the infrastructure configuration explicit, repeatable, reviewable, and version-controlled.

The Terraform configuration defines the required networking, IAM, and Amazon EKS resources and allows the infrastructure to be provisioned or destroyed through Terraform.

# 2. Reusable Infrastructure Modules

I separated the infrastructure into three Terraform modules:

- VPC
- IAM
- EKS

The purpose of this separation is to keep individual infrastructure concerns independent and reusable.

The VPC module is responsible for the networking layer, the IAM module handles the IAM roles and policies required by EKS, and the EKS module provisions the Kubernetes control plane and managed node group.

The environment configurations consume these modules rather than duplicating the resource definitions for every environment.

# 3. Environment Separation

I created separate Terraform configurations for:

- Development
- Staging
- Production

Each environment has its own Terraform configuration and state key while consuming the shared infrastructure modules.

This provides a clear separation between environments and prevents the Terraform state of one environment from being mixed with another.

The development environment was used for the actual infrastructure deployment and verification during this project.

# 4. Remote Terraform State

I implemented remote Terraform state management using Amazon S3.

The bootstrap configuration provisions the S3 bucket used to store Terraform state and enables versioning and server-side encryption.

I also provisioned a DynamoDB table for Terraform state locking.

The purpose of remote state and locking is to provide centralized state management and prevent concurrent Terraform operations from modifying the same state simultaneously.

# 5. AWS Network Design

I designed the VPC with separate public and private subnets distributed across three Availability Zones.

The development VPC uses the following CIDR allocation:

- VPC: `10.0.0.0/16`

Public subnets:

- `10.0.1.0/24`
- `10.0.2.0/24`
- `10.0.3.0/24`

Private subnets:

- `10.0.11.0/24`
- `10.0.12.0/24`
- `10.0.13.0/24`

The networking configuration includes an Internet Gateway for public subnet connectivity and a NAT Gateway for outbound connectivity from the private subnets.

The EKS cluster and managed worker nodes are associated with the private subnets.

# 6. Amazon EKS Provisioning

I provisioned an Amazon EKS cluster together with an EKS managed node group.

The EKS module receives the VPC ID and private subnet IDs from the VPC module and the IAM role ARNs from the IAM module.

This establishes explicit dependencies between the networking, IAM, and EKS layers instead of duplicating resource information between modules.

The development environment was configured with a managed node group using:

- Instance type: `t3.micro`
- Desired nodes: `3`
- Minimum nodes: `1`
- Maximum nodes: `3`

# 7. IAM Separation

I created separate IAM roles for the EKS control plane and EKS worker nodes.

The EKS cluster role and node role have different trust relationships and policy requirements.

The cluster role is assumed by the EKS service, while the worker node role is assumed by EC2.

The node role includes the permissions required for the worker nodes to operate with Amazon EKS, the Amazon VPC CNI, and Amazon ECR.

This separation follows the responsibility boundaries between the EKS control plane and the worker nodes.

## What I Implemented

The completed project contains the following infrastructure components.

## Terraform Bootstrap Layer

- Amazon S3 bucket for Terraform remote state
- S3 bucket versioning
- S3 server-side encryption
- S3 public access blocking
- DynamoDB table for Terraform state locking

## Networking Layer

- Amazon VPC
- Internet Gateway
- Three public subnets
- Three private subnets
- Elastic IP
- NAT Gateway
- Public route table
- Private route table
- Public route associations
- Private route associations

## IAM Layer

- EKS cluster IAM role
- EKS node IAM role
- EKS cluster policy attachment
- EKS worker node policy attachments
- Amazon VPC CNI policy attachment
- Amazon ECR read-only policy attachment

## EKS Layer

- Amazon EKS cluster
- Amazon EKS managed node group

# Technology Stack

The project uses the following technologies:

|   Technology                                        |     Purpose 

| Terraform                                           | Infrastructure as Code 
| AWS                                                 | Cloud infrastructure platform 
| Amazon VPC                                          | Network infrastructure 
| Amazon S3                                           | Terraform remote state storage 
| Amazon DynamoDB                                     | Terraform state locking 
| AWS IAM                                             | Identity and access management 
| Amazon EKS                                          | Managed Kubernetes control plane 
| Amazon EC2                                          | EKS worker nodes 


## Deployment Evidence

The repository contains screenshots captured during the implementation and verification of the infrastructure.

The screenshots provide visual evidence of the AWS resources created through Terraform, including the VPC, subnets, route tables, NAT Gateway, IAM roles, EKS cluster, and worker nodes.

**Screenshot:**  
![Project Structure](<images/project structure.JPG>)

**Screenshot:**  
![S3 Bucket created to store terraform state](<images/s3 bucket created.JPG>)

**Screenshot:**  
![DynamoDB created for terraform state lock](<images/dynamodb lock state.JPG>)

**Screenshot:**  
![VPC for Dev environment](<images/dev vpc created.JPG>)

**Screenshot:**  
![Public and private subnets created](<images/pub and priv subnets created.JPG>)

**Screenshot:**  
![Internet gateway created for pub subnet for dev env](<images/dev internet gateway.JPG>)

**Screenshot:**  
![Elastic IP created for NAT gateway for resources in priv sub to access internet](<images/elastic ip for nat gateway.JPG>)

**Screenshot:**  
![NAT gateway for internet access into pub subnet](<images/dev nat gateways.JPG>)

**Screenshot:**  
![Route table](<images/dev route tables.JPG>)

**Screenshot:**  
![IAM roles for EKS cluster and managed node groups](<images/IAM roles created.JPG>)

**Screenshot:**  
![EKS cluster created](<images/eks deployed.JPG>)

**Screenshot:**  
![The 3 Worker nodes created running](<images/our nodes are up and running.JPG>)

**Screenshot:**  
![Output of all the dev resources created](<images/all dev resources created.JPG>)


## Terraform Architecture and Project Structure

I structured the project into three layers: a bootstrap layer, reusable Terraform modules, and environment configurations.

terraform-aws-eks-platform/
├── bootstrap/
├── modules/
│   ├── vpc/
│   ├── iam/
│   └── eks/
└── environments/
    ├── dev/
    ├── staging/
    └── prod/
Bootstrap

![Architectural Diagram of the module](<images/Terraform Architectural Diagram.jpeg>)


The bootstrap configuration provisions the infrastructure required for Terraform remote state management:

S3 bucket for Terraform state
DynamoDB table for state locking
State bucket versioning and encryption

The bootstrap layer is managed separately because the environment configurations depend on these resources for remote state management.

# Reusable Modules

The infrastructure is divided into three modules:

Module	Responsibility
vpc	VPC, subnets, Internet Gateway, NAT Gateway, route tables and associations
iam	EKS cluster and worker node IAM roles and policy attachments
eks	EKS cluster and managed node group

Each module exposes the values required by other parts of the configuration through Terraform outputs.

For example, the VPC module provides the private subnet IDs used by the EKS module, while the IAM module provides the IAM role ARNs required by the EKS cluster and node group.

# Environment Configurations

The environments directory contains separate root Terraform configurations for:

dev
staging
prod

Each environment consumes the same reusable modules while providing its own configuration values and remote state key.

This allows the infrastructure definition to remain centralized while maintaining separate environment configurations and Terraform state.

The development environment was deployed and verified during this project. The staging and production configurations were created to allow the same infrastructure to be provisioned in those environments when required.

# Why I Used This Structure

I used this structure to avoid duplicating the same infrastructure definitions across environments.

The modules contain the reusable infrastructure logic, while the environment directories determine how that infrastructure is configured for Dev, Staging, and Production.

This provides a clear separation between reusable infrastructure components and environment-specific configuration while keeping the repository straightforward to maintain.


## Stage 3: AWS Infrastructure Design

The AWS infrastructure is divided into three main areas: networking, IAM, and Amazon EKS. Terraform modules are used to manage each area independently.

### 3.1 Networking

The VPC module creates the network foundation for the EKS platform.

The development environment uses:

- VPC CIDR: `10.0.0.0/16`
- Three public subnets
- Three private subnets
- Internet Gateway
- NAT Gateway
- Elastic IP
- Public and private route tables
- Route table associations

The subnet allocation is:

| Subnet     |      CIDR      |

| Public 1   | `10.0.1.0/24`  |
| Public 2   | `10.0.2.0/24`  |
| Public 3   | `10.0.3.0/24`  |
| Private 1  | `10.0.11.0/24` |
| Private 2  | `10.0.12.0/24` |
| Private 3  | `10.0.13.0/24` |

I separated the public and private subnets to establish different network paths within the VPC.

The public route table uses the Internet Gateway for internet connectivity. The private route table routes outbound traffic through the NAT Gateway.

The NAT Gateway is placed in a public subnet, while the private subnets use it for outbound internet access without being directly exposed through an Internet Gateway route.

The three Availability Zones provide subnet distribution across multiple Availability Zones rather than placing the entire network in a single Availability Zone.

![Development VPC](./images/dev%20vpc%20created.JPG)


![Public and Private Subnets](./images/pub%20and%20priv%20subnets%20created.JPG)


![Internet Gateway](./images/dev%20internet%20gateway.JPG)


![Elastic IP](./images/elastic%20ip%20for%20nat%20gateway.JPG)


![NAT Gateway](./images/dev%20nat%20gateways.JPG)


![Route Tables](./images/dev%20route%20tables.JPG)

### 3.2 IAM

The IAM module creates separate IAM roles for the EKS cluster and EKS worker nodes.

The EKS cluster role is assumed by the EKS service and has the `AmazonEKSClusterPolicy` policy attached.

The worker node role is assumed by EC2 and has the following policies attached:

- `AmazonEKSWorkerNodePolicy`
- `AmazonEKS_CNI_Policy`
- `AmazonEC2ContainerRegistryReadOnly`

I separated the cluster and node roles because they serve different AWS resources and therefore have different trust relationships and permission requirements.

The role ARNs are exposed as module outputs and passed to the EKS module.

![IAM Roles](./images/IAM%20roles%20created.JPG)

### 3.3 Amazon EKS

The EKS module provisions the EKS cluster and an EKS managed node group.

The cluster and node group use the private subnet IDs produced by the VPC module.

The environment configuration passes the networking and IAM outputs into the EKS module instead of hardcoding those resource IDs.

The development environment was configured with:

| Configuration                 |   Value     |

| Kubernetes version variable   | `1.33`      |
| Node instance type            | `t3.micro`  |
| Desired nodes                 | `3`         |
| Minimum nodes                 | `1`         |
| Maximum nodes                 | `3`         |

The managed node group is configured with a desired capacity of three nodes and a scaling range of one to three nodes.

The use of an EKS managed node group delegates node group management to Amazon EKS rather than requiring individual EC2 instances to be managed directly through separate Terraform resources.


![EKS Cluster](./images/eks%20deployed.JPG)


![EKS Worker Nodes](./images/our%20nodes%20are%20up%20and%20running.JPG)

### 3.4 Infrastructure Relationship

The infrastructure components are connected through Terraform module inputs and outputs.

VPC Module
    │
    ├── VPC ID
    └── Private Subnet IDs
             │
             ▼
        EKS Module
             ▲
             │
    IAM Module
    ├── Cluster Role ARN
    └── Node Role ARN

The VPC module provides the network resources required by EKS, while the IAM module provides the roles required by the EKS cluster and worker nodes.

This keeps the resource definitions separated while allowing Terraform to establish the dependencies required to provision the platform.

# 3.5 Infrastructure Design Rationale

The infrastructure design was based on separation of responsibilities.

The VPC module manages networking, the IAM module manages EKS permissions, and the EKS module manages the Kubernetes infrastructure.

I placed the EKS cluster and managed node group in private subnets to keep the worker nodes on the private side of the VPC. The NAT Gateway provides outbound connectivity from the private network.

The resulting design provides a clear relationship between the network, identity, and compute layers while allowing each layer to be maintained independently.


## Stage 4: Environment Configuration and Deployment

The project uses separate Terraform root configurations for Dev, Staging, and Production.

Each environment consumes the same reusable VPC, IAM, and EKS modules while maintaining its own configuration and Terraform state.

### 4.1 Environment Separation

The environment structure is:

environments/
├── dev/
├── staging/
└── prod/

Each environment contains its own:
Backend configuration
Provider configuration
Terraform version requirements
Variables
Environment-specific values
Module composition
Outputs

The infrastructure logic remains inside the shared modules.

This means that changes to the underlying VPC, IAM, or EKS implementation can be managed centrally instead of maintaining separate copies of the same resource definitions.

# 4.2 Development Environment

The development environment was used for the actual deployment and verification of the platform.

The deployment was performed from:

cd environments/dev

The Terraform configuration initializes the remote backend and loads the shared modules from the project root.

The deployment workflow used was:

terraform init
terraform validate
terraform plan
terraform apply

I used terraform validate before the deployment to verify that the Terraform configuration was syntactically valid and internally consistent.

I then used terraform plan to review the infrastructure changes Terraform intended to make before applying them.

Finally, terraform apply provisioned the AWS resources defined by the configuration.

# 4.3 Module Composition in Development

The development root configuration consumes the three project modules:

Dev Environment
      │
      ├── VPC Module
      │
      ├── IAM Module
      │
      └── EKS Module

The VPC module creates the networking infrastructure.

The IAM module creates the IAM roles required by EKS.

The EKS module consumes outputs from the VPC and IAM modules to create the EKS cluster and managed node group.

This allows the development configuration to compose the infrastructure without containing the individual AWS resource definitions itself.

# 4.4 Remote Backend

The environment configurations use the S3 bucket created by the bootstrap configuration for remote Terraform state.

The development state is stored using the following state key:

dev/terraform.tfstate

The state locking configuration uses the DynamoDB table created during the bootstrap stage.

This provides separation between the state of the development environment and the state associated with other environments.

# 4.5 Staging Environment

The staging environment has its own Terraform root configuration:

environments/staging/

It consumes the same reusable modules used by the development environment.

The staging configuration was created so that the infrastructure can be provisioned independently when required.

Staging was not deployed during this project.

Therefore, this repository demonstrates the Terraform configuration required to provision the staging environment but does not claim that the staging AWS infrastructure was created or verified during the project.

# 4.6 Production Environment

The production environment has its own Terraform root configuration:

environments/prod/

Like the other environments, it consumes the shared VPC, IAM, and EKS modules.

The production configuration was created to make the infrastructure deployable to a separate production environment without duplicating the underlying module implementation.

Production was not deployed during this project.

The production directory should therefore be treated as a deployment-ready Terraform configuration rather than evidence of an active production deployment.

# 4.7 Deployment Model

The environments are operated independently.

Running Terraform from the development directory operates on the development configuration and its associated state.

For example:

cd environments/dev
terraform plan

does not automatically provision staging or production.

Staging and production can be operated separately by running Terraform from their respective environment directories.

Conceptually:

                 Shared Modules
                      │
        ┌─────────────┼─────────────┐
        │             │             │
        ▼             ▼             ▼
       Dev         Staging        Prod
        │             │             │
      State         State         State

This provides a clear boundary between environment configurations and their Terraform state.

# 4.8 Deployment Evidence

The development deployment was verified through the AWS Management Console after Terraform completed the provisioning process.

The captured evidence includes the provisioned VPC, subnets, networking components, IAM roles, EKS cluster, and worker nodes.
![Dev VPC](<images/dev vpc created.JPG>) ![Dev Route table](<images/dev route tables.JPG>) ![Dev NAT gateway for priv subnets](<images/dev nat gateways.JPG>) ![Dev Internet Gateway](<images/dev internet gateway.JPG>) ![Dev Environment getting created](<images/dev environment creating.JPG>)

The EKS worker nodes were also verified after the cluster was provisioned.

![Worker nodes up and running](<images/our nodes are up and running.JPG>)

# 4.9 Environment Design Rationale

I used separate environment directories rather than maintaining a single configuration with environment conditionals.

This makes the configuration for each environment explicit and keeps the state of each environment separate.

At the same time, the infrastructure implementation remains reusable because all three environments consume the same Terraform modules.

This provides a balance between reuse and environment isolation:

Reusable infrastructure logic
             +
Environment-specific configuration
             =
Reusable multi-environment platform

The development environment demonstrates the actual deployment, while the staging and production configurations provide the structure required to provision equivalent environments independently when needed.

# Stage 5: Validation, Evidence, and Troubleshooting

I used Terraform's validation and planning workflow before applying the infrastructure. After deployment, I also verified the resulting AWS resources through the AWS Management Console.

### 5.1 Terraform Validation

Before provisioning the development environment, I initialized Terraform and validated the configuration.

terraform init
terraform validate

terraform validate returned:

Success! The configuration is valid.

This provided an initial check that the Terraform configuration was syntactically valid before proceeding with the deployment.

## 5.2 Terraform Plan

After validation, I used:

terraform plan

The purpose of the plan was to review the resources Terraform intended to create before making changes to the AWS environment.

This provided an opportunity to identify configuration issues before running terraform apply.

## 5.3 Terraform Apply

After reviewing the planned changes, I provisioned the development infrastructure using:

terraform apply

Terraform then created the resources defined by the development environment configuration and the modules it consumed.

# 5.4 AWS Resource Verification

After the deployment, I verified the infrastructure from the AWS Management Console.

The verification covered the main infrastructure layers:

VPC
Public and private subnets
Internet Gateway
Elastic IP
NAT Gateway
Route tables
IAM roles
EKS cluster
EKS worker nodes

This provided confirmation that the Terraform configuration resulted in the expected AWS resources.

# 5.5 Deployment Evidence

The repository contains screenshots captured during the deployment and verification process.

VPC
![Dev VPV](<images/dev vpc created.JPG>)

Subnets
![Public and Private Subnets created](<images/pub and priv subnets created.JPG>)

Internet Gateway
![Internet Gateway](<images/dev internet gateway.JPG>)

NAT Gateway and Elastic IP
![Elastic IP for NAT gateway](<images/elastic ip for nat gateway.JPG>)

![NAT gateway](<images/dev nat gateways.JPG>)

Route Tables
![Route table](<images/dev route tables.JPG>)

IAM
![IAM roles](<images/IAM roles created.JPG>)

EKS Cluster
![EKS cluster](<images/eks deployed.JPG>)

EKS Worker Nodes
![Worker nodes running](<images/our nodes are up and running.JPG>)

# 5.6 Terraform State Locking Issue Encountered

During the development deployment, Terraform initially failed to acquire the state lock.

The error indicated that Terraform could not find the configured DynamoDB table:

ResourceNotFoundException:
Requested resource not found

The Terraform configuration was referencing:

eks-platform-terraform-state-lock-2026

while the DynamoDB table that had actually been created was:

eks-platform-terraform-state-lock

The issue was therefore a mismatch between the backend configuration and the actual DynamoDB table name.

I corrected the backend configuration to reference the existing DynamoDB table.

After correcting the configuration, Terraform was able to initialize the backend and proceed with the development deployment.


# 5.7 Verification Approach

I did not consider a successful terraform apply alone to be sufficient verification.

After Terraform completed, I checked the AWS resources to confirm that the expected infrastructure had been created.

The verification process covered both the infrastructure components and their relationships.

For example:

VPC
 │
 ├── Public Subnets
 │
 ├── Private Subnets
 │
 ├── Internet Gateway
 │
 └── NAT Gateway
        │
        └── Private Network Connectivity

VPC + IAM
     │
     ▼
    EKS
     │
     ▼
Managed Node Group

This helped confirm that the deployed AWS infrastructure corresponded to the architecture defined in Terraform.

5.9 Live Deployment Demonstration

A live video demonstration was also recorded during the project to provide additional evidence of the deployment process and resulting infrastructure.

# Live Demonstration:

[Live Demo](https://drive.google.com/file/d/1znZSAh6m0HOhe9eG-XiODJHoWOtX3EOu/view?usp=drive_link)

The video complements the screenshots by showing the deployment and verification process rather than only presenting the final AWS console state.

# Conclusion

I built this project to demonstrate how I approach AWS infrastructure using Terraform.

The implementation separates reusable infrastructure modules from environment-specific configurations while establishing remote state management and state locking as part of the Terraform foundation.

The development environment was provisioned and verified on AWS, while staging and production configurations were created so that the same infrastructure can be provisioned independently when required.

---

<div align="center">

# PROJECT ANNOTATION

### Terraform AWS EKS Platform

<br>

**DESIGNED AND IMPLEMENTED BY**

## TOLULOPE OLALERE

### Cloud / DevOps Engineer

<br>

`AWS`  •  `Terraform`  •  `Infrastructure as Code`  •  `Amazon EKS`

<br>

**Infrastructure Engineering Portfolio**

<br>

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

**Project Scope**

Terraform-based AWS infrastructure provisioning  
Reusable infrastructure modules  
Environment-specific configurations  
Remote Terraform state management  
Amazon EKS platform provisioning

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

**Implementation Status**

Development — **Deployed and Verified**

Staging — **Configuration Implemented**

Production — **Configuration Implemented**

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

**Engineering Ownership**

Designed • Implemented • Deployed • Validated • Documented

**Tolulope Olalere**

</div>

---