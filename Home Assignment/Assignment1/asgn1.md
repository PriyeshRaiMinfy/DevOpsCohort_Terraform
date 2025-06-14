## Assignment 1 – Summary
---
### 1) Initialized a main.tf file with:

Terraform block - AWS provider
Provider block - region and SSO profile
S3 bucket resource for static website
Public access block
S3 object resource to upload index.html

Created an index.html file with simple HTML content

Ran terraform init (initially with local backend)

Verified the configuration with terraform validate
    terraform init
    terraform validate
![inintandvarify1](./ass1images/Screenshot%202025-06-14%20135243.png)
---
Planned and applied the infrastructure using:
    terraform plan
    terraform apply
![planapply1](./ass1images/Screenshot%202025-06-14%20135306.png)
![planapply1](./ass1images/Screenshot%202025-06-14%20135345.png)
![planapply1](./ass1images/Screenshot%202025-06-14%20135403.png)

#### => Verified the website URL from output
Website URL: ```priyeshrai-staticwebsite.s3-website.ap-south-1.amazonaws.co```
![websiteoutput](./ass1images/Screenshot 2025-06-14 135118.png)

#### => S3 bucket created to hoste static website
![s3bucket](./ass1images/Screenshot%202025-06-14%20135635.png)

---

### 2) Mannually created a S3 bucket : REMOTE BACKEND
![s3ss](./ass1images/Screenshot%202025-06-14%20142745.png)
#### It stores the tf state file
![s3ss](./ass1images/Screenshot%202025-06-14%20142709.png)
![s3ss](./ass1images/Screenshot%202025-06-14%20142720.png)

### 3) Remote Backend Configuration
Created backend.tf file with: S3 bucket as backend for remote state
```
terraform {
    backend "s3" {
        bucket  = "assignmet1-remote-backend"  
        key     = "priyeshterraform/state.tfstate"
        #folder inside bucket - where tfstate file will we saved
        region  = "ap-south-1"
        profile = "AdminAccess-611837361078"
        #sso profile
    }
}

```

Re-ran terraform init

Chose "yes" to copy local state to S3
![inintandvarify2](./ass1images/Screenshot%202025-06-14%20142915.png)

Verified terraform plan and apply after backend change
![planapply2](./ass1images/Screenshot%202025-06-14%20142935.png)


Verified:

Website URL works in browser
Website URL: 
```
priyeshrai-staticwebsite.s3-website.ap-south-1.amazonaws.co
```
![websiteoutput2](./ass1images/Screenshot%202025-06-14%20142637.png)

Assignment completed successfully