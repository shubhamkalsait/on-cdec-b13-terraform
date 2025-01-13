# Terraform


## Infrastructure as Code 

Three tier infra - 1 project - 2 Month
AWS - VPC, Subnet, IGW, NAT, EC2, Loadbalncer, AS, RDS, Route53, Cloudfront
after 1 year - 
Difficult Manage 
Documentation / Designs
Manually | Data integrity
Two cloud engineer - best practices - Reliable
2 Project - 2 month
-------

Coding - Terraform, Cloud Formation, Shell Script, Ansible, etc

OpenSource - IAC tool
HashiCorp
Terraform - Configuration

Language: Terraform Language

Blocks
-----
Resource
Data
Output
Variable
Provider
Terraform
Module

extension: .tf, .tf.json

Data types:
string: "Shubham kalsait", "1234235"
number: 143973249 
bool: true/false, 0/1
list: ["apple", "banana", "apple", 131643,"mango"] mutable
tuple: ("apple", "banana", "apple", 131643,"mango") immutable
set: {"apple", "banana", 131643, "mango"} mutable
map: {fruit = "apple", name = "shubham", address = "Hinganghat" }


## Installation Terraform


## Terraform Lifecycle

Write Code - Terraform configuration .tf

terraform init - initialise terraform provider, download lib, download plugins, initialize modules, variables varify
.terraform/  
.terraform.lock.hcl - 

terraform plan - Blueprint infrastructure
+ (Add resource) - (Delete Resource) ~ (Change Resource) 

terraform apply - Create infrastructure
terraform.tfstate - infra state, terraform refer tfstate first 
terraform.tfstate.backup
terraform destroy - delete complete infra



pedefined tf conf

ec2
rds
route53
lb
as
vpc
s3
iam

terraform.state 

- local and working dir create 
- all information


A - terraform.state(v3) - tf apply -> terraform.state(v3) bucket

B - terraform.state(v2) -> dev-bucket/prod-bucket/test-bucket

C - terraform.state(v2) 

backend - remote tfstate


HW, 

1) Terraform IAM user > console login + programatic access > Policy s3 full access
2) Create s3 bucket > write a shell script to copy file from one s3 bucket to another
3) Terraform Three tier infra : https://medium.com/@aaloktrivedi/building-a-3-tier-web-application-architecture-with-aws-eb5981613e30


### Workspace
Multiple - Terraform Workspace / terraform.tfstate

### Loop

1. Count - Simplest loop 
2. For - variables and output
3. For Each - for different configurations


echo "hi"
echo "welcome"
echo "world"

conf = {hi, welcome, world}
for i in conf;
    echo $i;


terraform taint - mark (recreat)
- currupt

terraform -> .tf - tfstate 

Terraform import

terraform destroy --target=aws_instance.demo_import_instance


Terraform provisioners
---------------------

remote-exec - ./script.sh
local-exec - echo "hurray! resource created"
file - script.sh

HW, 

Launch eks cluster using terraform 
Configuration:
1)    resournce name: aws_eks_cluster
        cluster name
        kubernetes version:
        cluster IAM role:
        Node Iam Role
        vpc:
        subnets:


2) Cluster Role:
    resource name: aws_iam_role
    role-type:
    policy: AmazonEksClusterPolicy
    rolename: 

3) Node Role:

    resource name: aws_iam_role
    role-type:
    policy: ContainerRegisyryReadOnly, EKS_CNI, EKS_WORKERNODE, EKS_NETWORKING, EKS_CLUSTER 
    rolename: 

4) NodeGroup:
    resource: aws_eks_node_group
        name: 
        node role:
        instance_type:
        Disk Size:
        subnets:



HW.
- Create hybrid infrastructure for three tier microservice based application
(Diagram shared in the repo)


mutable - changable
eks - my-cluster - 1.20 - 1.21 - 1.22

immutable - unchangable
cluster - version - 1.20
1.21

Dependancy in Terraform
---------
1. Implicit
2. explicit - depends_on


workspace
--------
env - dev, test, uat, prod
tfstate

instance1 - env:dev
instance




