###  PALLISA-GITHUB-VPC
#### Project name: 
##### A Virtual Private Cloud (VPC) proposed for Pallisa General Hospital, provisioned using Terraform as an Infrastructure as code (Iac) tool in Amazon Web Services (AWS).

##### Project Abstract
##### This project aims to build and provision a Virtual Private Cloud (VPC) for Pallisa General Hospital using Terraform on Amazon Web Services (AWS). The aim is to address the hospital's current IT infrastructure challenges, including data security risks, inefficient resource management, and scalability issues. By leveraging cloud computing and Infrastructure-as-Code (IaC) principles, the project seeks to enhance IT resilience, security, and scalability while reducing operational costs. The objectives include architecting a custom VPC, implementing it using Terraform, enhancing security and compliance with Ugandan healthcare regulations, and improving resource scalability. The project will follow a structured approach, including a literature review, requirements gathering, architecture design, Terraform implementation, and evaluation. The outcome is expected to serve as a benchmark for rural hospitals, demonstrating how cloud computing and IaC tools can transform healthcare infrastructure and improve patient care.

#### Below is the Link to the VPC Architectural diagram 
[https://github.com/Mozenty/vpc-tier-module-08/blob/main/vpc.drawio.png]

#☀️ Pallisa VPC module
stands a 3-tier VPC with NAT-gateway,Security Group and Application Load Balancer.
### Project objectives:
+ Infrastructure as code: Use of terraform to define a VPC and its components; ensures repeatability and version control.
+ High Availability: VPC resources are designed to be highly available across multiple Availability Zones.
+ Security: Security Groups for EC2, Network ACLs for subnet level,VPN or Direct Connect for secure access from on-prem resources.
    + storing of state file in s3 and locking it using a dynamo-db table is possible.
+ Scalability: The architecture has auto-scaling groups, load balancers.
    + possibly even multi-region support for future growth.
+ Cost-Efficiency: Cost-saving measures like reserved instances for resources that are continously running or spot instances for statelss apps.
+ Monitoring and Logging: Implementation of AWS CloudWatch, CloudTrail, and possibly third-party solutions like datadog, splunk.
### Steps taken:
✋ Make sure all commits are digitally signed.
+ First, please see reference to the architecture.
[https://github.com/Mozenty/vpc-tier-module-08/blob/main/vpc.drawio.png]
### create the vpc main.tf file and the varaibles.tf side by side
### Inside the main.tf file, create the following resources:
#### - create the vpc.
#### - create internet gateway and attach it to the vpc
## Inside the variables file
1. If possible, use data source to get a list of all availability zones in prefered regions.
2. create public subnet in az1 (all AZs are indexed [0,1])
3. create public subnet in az2
4. create route table and add a public route
5. associate public subnet az1 to the "public route table"
6. associate public subnet az2 to the "public route table"
7. create a private application subnet in az1
8. create a private application subnet in az2
9. create a private database subnet in az1
10. create a private database subnet in az2

####  (review the main.tf file code and save)
####  On the other hand, create variables as follows;
#### - for the region and project_name.
#### - create variable for the public_subnet_az1_cidr
#### - create variable for the public_subnet_az2_cidr
#### - create variable for the private_app_subnet_az1_cidr
#### - create variable for the private_app_subnet_az2_cidr
#### - create variable for the private_db_subnet_az1_cidr
#### - create variable for the private_db_subnet_az2_cidr
##### (review the variable file code and save)
## Develop the output.tf file 
(this allows us to export some values from this vpc, and we can reference them when we create other resources)
### The first output will export our region.
#### - export the project name
#### - export the vpc id as referenced in the main.tf file
#### - export the id of the public_subnet_az1
#### - export the id of the public_subnet_az2
#### - export the id of the private_app_subnet_az1
#### - export the id of the private_app_subnet_az2
#### - export the id of the private_db_subnet_az1
#### - export the id of the private_db_subnet_az2
### create a reference for the internet_gateway in the output file. 👇 
              output "aws_internet_gateway" { 
                     value = aws_internet_gateway.igw-interview 
                            } # no id is needed.
### reference the created vpc module above in another project if necessary.
*  This will demonstrate the re-usability of terraform modules
* The ease of application and replication that Iac using terraform gives
#### I created another folder called(Pallisa-hospital-vpc).
#### The appleSCH-website project will store its terraform state file in an s3.
### - configure aws provider for the apple-sch-website project.
####  I opened a backend.tf file in the project folder for the state file
#### - Log into the Amazon console and create an s3 bucket.
#### - Enter the bucket name, key, region and profile in the backend.tf file.
#### - Its possible to enable state locking using a dynamoDB. 
+ This prevents multiple team members from applying changes simultaneously, which could result in an inconsistent or corrupt state.
+ Reduce the risk of state corruption that could occur if multiple write operations happen concurrently.
+ Locking adds an extra layer of protection against unintended modifications, helping ensure that critical resources are not accidentally destroyed or altered.
+ Good for auditing changes and understanding sequence of events incase of troubleshooting.
#### - create vpc for Pallisa Hospital
#### - reference the vpc module already created under the pallisa-root-vpc
#### (double period takes one up two directories)
#### - list all variables for the vpc
#### - create the terraform.tfvars file



