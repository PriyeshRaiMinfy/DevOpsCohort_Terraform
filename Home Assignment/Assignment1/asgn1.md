## Assignment 1 – Summary
---

### 1) Initialized a `main.tf` file with:

- Terraform block – AWS provider
- Provider block – region and SSO profile
- S3 bucket resource for static website
- Public access block
- S3 object resource to upload `index.html`

- Created an `index.html` file with simple HTML content

- Ran terraform init (initially with local backend)

- Verified the configuration with terraform validate:
  ```
  terraform init  
  terraform validate
  ```
  ![init and validate](./ass1images/screenshot_2025_06_14_135243.png)

---

- Planned and applied the infrastructure using:
  ```
  terraform plan  
  terraform apply
  ```
  ![plan 1](./ass1images/screenshot_2025_06_14_135306.png)  
  ![plan 2](./ass1images/screenshot_2025_06_14_135345.png)  
  ![plan 3](./ass1images/screenshot_2025_06_14_135403.png)

- ✅ Verified the website URL from output  
  Website URL:  
  ```
  priyeshrai-staticwebsite.s3-website.ap-south-1.amazonaws.com
  ```
  ![website output](./ass1images/screenshot_2025_06_14_135118.png)

- ✅ S3 bucket created to host static website  
  ![s3 bucket](./ass1images/screenshot_2025_06_14_135635.png)

---

### 2) Manually created an S3 bucket: **REMOTE BACKEND**

- This bucket is used to store the Terraform state file  
  ![backend bucket 1](./ass1images/screenshot_2025_06_14_142745.png)  
  ![backend bucket 2](./ass1images/screenshot_2025_06_14_142709.png)  
  ![backend bucket 3](./ass1images/screenshot_2025_06_14_142720.png)

---

### 3) Remote Backend Configuration

- Created `backend.tf` file with:  
  - S3 bucket as backend for remote state

```hcl
terraform {
  backend "s3" {
    bucket  = "assignmet1-remote-backend"  
    key     = "priyeshterraform/state.tfstate"
    region  = "ap-south-1"
    profile = "AdminAccess-611837361078"
  }
}
```

- Re-ran `terraform init`

- Chose "yes" to copy local state to S3  
  ![re-init](./ass1images/screenshot_2025_06_14_142915.png)

- Verified terraform plan and apply after backend change  
  ![final apply](./ass1images/screenshot_2025_06_14_142935.png)

---

### Final Check

- Website URL still works in browser  
  ```
  priyeshrai-staticwebsite.s3-website.ap-south-1.amazonaws.com
  ```
  ![website after backend](./ass1images/screenshot_2025_06_14_142637.png)

---

✅ **Assignment completed successfully**