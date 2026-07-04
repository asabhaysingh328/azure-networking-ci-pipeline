# Azure Networking CI/CD Pipeline with Jenkins + Terraform

This project demonstrates an ** CI/CD pipeline** for deploying Azure networking infrastructure using Jenkins and Terraform.

## Features
- Jenkins pipeline with secure credential injection
- Modular Terraform code (VNet, Subnet, NSG)
- Automated stages: init → validate → plan → apply
- Infrastructure as Code (IaC) for reproducible deployments
- Ready for enterprise extension (VMs, AKS, App Services)

## Architecture
GitHub → Jenkins → Terraform → Azure

## Resources Deployed
- Resource Group
- Virtual Network (VNet)
- Subnet
- Network Security Group (NSG)

## Why This Project?
- Showcases CI/CD + IaC skills
- Demonstrates secure, scalable cloud architecture
- Perfect for LinkedIn portfolio and Solution Architect preparation



---

## 📖 Jenkinsfile Description

This Jenkinsfile defines a **CI/CD pipeline** that automates Azure deployments using Terraform.  

### 🔑 Environment
- Injects Azure Service Principal credentials (`ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`, `ARM_TENANT_ID`, `ARM_SUBSCRIPTION_ID`) securely from Jenkins credentials.  
- No secrets are hardcoded — industry best practice.

### ⚙️ Stages
1. **Checkout Code**  
   - Pulls the latest Terraform project from GitHub.  
   - Ensures Jenkins always works with the newest IaC definitions.

2. **Terraform Init**  
   - Initializes Terraform in the `terraform/` directory.  
   - Downloads provider plugins and prepares the backend.

3. **Terraform Validate** *(optional but recommended)*  
   - Validates syntax and configuration before planning.  
   - Prevents common errors early.

4. **Terraform Plan**  
   - Generates an execution plan (`tfplan`).  
   - Shows what resources will be created, updated, or destroyed in Azure.

5. **Terraform Apply**  
   - Applies the plan automatically (`-auto-approve`).  
   - Deploys the defined Azure infrastructure.

### 📊 Post Actions
- **Success** → Prints ✅ “Terraform deployment completed successfully!”  
- **Failure** → Prints ❌ “Terraform deployment failed. Check logs.”  

---

## 📖 Terraform Scripts Description

### `main.tf`
- Defines the **Azure provider**.  
- Calls **modules** for Virtual Network, Subnet, and Network Security Group (NSG).  
- Each module is self‑contained and reusable.

### `variables.tf`
- Declares input variables for resource names, location, and address spaces.  
- Provides defaults (`eastus`, `tf-vnet`, `tf-subnet`, etc.).  
- Makes the configuration flexible and reusable across environments.

### `outputs.tf`
- Exposes the names of created resources (VNet, Subnet, NSG).  
- Useful for chaining into other modules or CI/CD steps.

### `modules/vnet`
- Creates a **Virtual Network** with a configurable address space.  
- Outputs the VNet name.

### `modules/subnet`
- Creates a **Subnet** inside the VNet.  
- Accepts prefix and name as variables.  
- Outputs the Subnet name.

### `modules/nsg`
- Creates a **Network Security Group**.  
- Includes a sample inbound rule (Allow SSH on port 22).  
- Outputs the NSG name.

---

## 🔄 Architecture Diagram

```text
   ┌────────────┐        ┌──────────────┐        ┌───────────────┐        ┌───────────────┐
   │   GitHub   │  --->  │   Jenkins    │  --->  │   Terraform   │  --->  │     Azure      │
   └────────────┘        └──────────────┘        └───────────────┘        └───────────────┘
        |                     |                        |                        |
        |   Code Repo          |   Pipeline Stages      |   IaC Execution        |   Cloud Resources
        |   (Jenkinsfile +     |   (Init → Plan →       |   (init/plan/apply)    |   (RG, VNet, Subnet, NSG)
        |   Terraform files)   |   Apply)               |                        |
```

---

## ✅ Why This Project is Industry‑Level
- **Modular Terraform** → scalable and reusable.  
- **Secure Jenkins pipeline** → credentials managed properly.  
- **Networking resources (VNet, Subnet, NSG)** → realistic enterprise infrastructure.  
- **CI/CD automation** → every GitHub commit can trigger a deployment.  

---

