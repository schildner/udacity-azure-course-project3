# Overview

This is a final project ~~submission~~ (work in progress) for [Udacity Azure DevOps Course](https://www.udacity.com/course/devops-engineer-for-microsoft-azure-nanodegree--nd082): Ensuring Quality Releases.

## Project Specifications

### 1. Terraform

Create the following resources for a specific environment tier:

- AppService
- Network
- Network Security Group
- Public IP
- Resource Group
- Linux VM (created by you -- use a Standard_B1s size for lowest cost)

Instructions:

- Navigate to the environment / test directory, then run terraform init, plan, apply.

```bash
cd terraform/environment/test
terraform init
terraform plan
terraform apply
```

### 2. Azure DevOps CI/CD pipeline

- Create the tasks that allow for Terraform to run and create the above resources.
- Execute Test Suites for:
  - Postman - runs during build stage
  - Selenium - runs on the linux VM in the deployment stage
  - JMeter - runs against the AppService in the deployment stage

### 3. Postman

- Create a Regression Test Suite from the Starter APIs. Use the Publish Test Results task to publish the test results to Azure Pipelines.
- Create a Data Validation Test Suite from the Starter APIs.

### 4. Selenium

- Create a UI Test Suite that adds all products to a cart, and then removes them.
- Include print() commands throughout the tests so the actions of the tests can easily be determined. E.g. A login function might return which user is attempting to log in and whether or not the outcome was successful.
- Deploy the UI Test Suite to the linux VM and execute the Test Suite via the CI/CD pipeline.

### 5. JMeter

- Use the starter APIs to create two Test Suites. Using variables, reference a data set (csv file) in the test cases where the data will change.
- Create a Stress Test Suite
- Create a Endurance Test Suite
- Generate the HTML report (non-CI/CD) IMPORTANT: Since the AppService is using the Basic/Free plan, start small (2 users max) and once you are ready for the final submission, use up to 30 users for a max duration of 60 seconds. The "Data Out" quota for the AppService on this plan is only 165 MiB.

### 6. Azure Monitor

- Configure an Action Group (email)
- Configure an alert to trigger given a condition from the AppService
- The time the alert triggers and the time the Performance test is executed ought to be very close.

### 7. Direct the output of the Selenium Test Suite to a log file, and execute the Test Suite

- Configure custom logging in Azure Monitor to ingest this log file. This may be done non-CI/CD.
