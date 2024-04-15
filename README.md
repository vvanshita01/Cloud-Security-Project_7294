**Project Name:** Azure Resource Provisioning

**Objective:** To automate the deployment of Azure infrastructure resources using Terraform, including a Linux virtual machine, network components (virtual network, subnet, network interface), and role assignments.

**Key Components:**  
**Azure Linux Virtual Machine:** Provision a Linux virtual machine with specified configuration settings such as size, OS image, SSH key, and managed identity.  
**Network Resources:** Create network-related resources such as a virtual network, subnet, and network interface to ensure connectivity for the virtual machine.  
**Role Assignment:** Assign the "Contributor" role to the managed identity of the virtual machine, granting it full access permissions to manage Azure resources within the specified scope.  

**Purpose:** The purpose of this project is to streamline and automate the process of deploying and configuring Azure infrastructure resources using Infrastructure as Code (IaC) principles. By defining the infrastructure configuration in Terraform code, the project aims to achieve consistency, repeatability, and efficiency in provisioning Azure resources. Additionally, by assigning appropriate roles to resources, it ensures that access control is properly managed and adheres to security best practices. Overall, the project aims to simplify the management and maintenance of Azure infrastructure deployments.
