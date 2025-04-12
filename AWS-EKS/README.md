# Terraform AWS EKS Cluster Setup

This project provides an Amazon Elastic Kubernetes Service (EKS) cluster using
Terraform and the official AWS EKS module. The configuration follows best
practices, including networking, security, and cost-effective node groups.

## Features
* EKS Cluster (v1.31) with public access enabled
* VPC Configuration with private, public, and intra subnets
* Managed Node Group with a SPOT + ON_DEMAND instance strategy
* IAM Role for Node Groups to ensure proper permissions
* Essential Cluster Add-ons (VPC CNI, CoreDNS, Kube Proxy)
* Custom AWS Security Group

## Folder Structure

├── main.tf # Main Terraform configuration

├── vpc.tf # VPC configuration

├── eks.tf # EKS Cluster setup

├── variables.tf # Variables for Terraform modules

├── iam.tf # IAM roles and policies for worker nodes

├── outputs.tf # Outputs for Terraform modules

├── outputs.tf # Outputs for Terraform modules

├── security_group.tf # Custom security group for node access(HTTP, SSH, etc.)

└── README.md # Project Documentation
