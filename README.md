# AD PowerShell Automation Lab

PowerShell scripts built in a Windows Server 2019 
home lab environment to automate common Active 
Directory administration tasks.

## Lab Environment
- Windows Server 2019 — Domain Controller
- Windows 10 Workstation joined to LAB.local
- VMware virtualization platform
- Domain: LAB.local

## Scripts

### 1. BulkUserCreation.ps1
Creates multiple AD user accounts automatically 
from a CSV file. Handles OU placement, department 
assignment, job title, and forces password change 
at first login.

### 2. PasswordReset.ps1
Resets a user account password via PowerShell and 
forces the user to change it at next logon. 
Replicates the most common Help Desk ticket 
workflow.

### 3. GroupManagement.ps1
Adds and removes users from Active Directory 
security groups. Demonstrates the full access 
management cycle used by Help Desk teams daily.

## Blog Post
Full walkthrough with screenshots available on 
Medium: https://medium.com/@shawdrevon/automating-active-directory-administration-with-powershell-afd332f4a045
