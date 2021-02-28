# Overview

[![Build Status](https://dev.azure.com/udacity-course/project3-qa/_apis/build/status/schildner.udacity-azure-course-project3?branchName=main)](https://dev.azure.com/udacity-course/project3-qa/_build/latest?definitionId=3&branchName=main)

This is a final project submission for [Udacity Azure DevOps Course](https://www.udacity.com/course/devops-engineer-for-microsoft-azure-nanodegree--nd082): Ensuring Quality Releases.

## Project Specifications

### 1. Create Azure DevOps CI/CD pipeline

#### Create the tasks that allow for Terraform to run and create the resources:

Resource | Created via TF
:--- | :---:
AppService | :white_check_mark:
Network | :white_check_mark:
Network Security Group | :white_check_mark:
Public IP | :white_check_mark:
Resource Group | :white_check_mark:
Linux VM (created using Packer -- using a Standard_B1s size for lowest cost) | :white_check_mark:

#### Execute Test Suites

Test Type | Technology | CI/CD Pipeline Execution | Status
:--- | :--- | :--- | :---:
Integration | Postman | Build Stage | :white_check_mark:
UI | Selenium | Deployment Stage - runs in custom linux VM | :white_check_mark:
Performance | JMeter | Deployment Stage - runs against the AppService| :white_check_mark:

### 2. Azure Monitor

Goal | Status
:--- | :---:
Configure an Action Group (email) | :white_check_mark:
Configure an alert to trigger given a condition from the AppService. | :white_check_mark:
The time the alert triggers and the time the Performance test is executed ought to be very close. | :white_check_mark:
Direct the output of the Selenium Test Suite to a log file, and execute the Test Suite. | :white_check_mark:
Configure custom logging in Azure Monitor to ingest this log file. This may be done non-CI/CD. |

### Test Suites Execution Details

#### 1. Postman

- Create a Regression Test Suite from the Starter APIs. 
- Use the Publish Test Results task to publish the test results to Azure Pipelines.
- Create a Data Validation Test Suite from the Starter APIs.

#### 2. Selenium

- Create a UI Test Suite that adds all products to a cart, and then removes them.
- Include print() commands throughout the tests so the actions of the tests can easily be determined. E.g. A login function might return which user is attempting to log in and whether or not the outcome was successful.
- Deploy the UI Test Suite to the linux VM and execute the Test Suite via the CI/CD pipeline.

#### 3. JMeter

- Use the starter APIs to create two Test Suites. Using variables, reference a data set (csv file) in the test cases where the data will change.
- Create a Stress Test Suite
- Create a Endurance Test Suite 
- Generate the HTML report (non-CI/CD)

IMPORTANT: Since the AppService is using the Basic/Free plan, start small (2 users max) and once you are ready for the final submission, use up to 30 users for a max duration of 60 seconds. The "Data Out" quota for the AppService on this plan is only 165 MiB.

## Instructions to Deploy Cloud Infrastructure from local PC with Terraform

- Configure Authentication via Service Principal and Client Secret

  Following [the guide](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret) we can set up the service principal allowing terraform to change resources in selected subscription scope.

  Executing `az ad sp create-for-rbac` command as described in the guide above the following output gets printed on console.

  ```bash

  {
    "appId": "00000000-0000-0000-0000-000000000000",
    "displayName": "azure-cli-2017-06-05-10-41-15",
    "name": "http://azure-cli-2017-06-05-10-41-15",
    "password": "0000-0000-0000-0000-000000000000",
    "tenant": "00000000-0000-0000-0000-000000000000"
  }
  ```

  Then we need to export the following environment variables which are then read by terraform:

  ```bash
  export ARM_CLIENT_ID=<value corresponds to appId printed on console>
  export ARM_CLIENT_SECRET=<value corresponds to password>
  export ARM_TENANT_ID=<value corresponds to tenant>
  ```

- Navigate to the environment / test directory, then run terraform init, plan, apply.

```bash
cd terraform/environment/test
terraform init
terraform plan -out solution.plan
terraform apply "solution.plan"
```
