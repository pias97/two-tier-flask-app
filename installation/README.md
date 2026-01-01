# Automatic installation of Docker on a Ubuntu machine.
## 1. To install Docker Engine on a VM, simply run this shell file.

```bash
sudo sh ./Docker.sh
```
## 2. Then permit the user to run Docker commands

```bash
sudo chown $USER /var/run/docker.sock
```

# Terraform (Optional)
If anyone wants to create EC2 instances on AWS by using Terraform `ec2 modules`, they can use them on their VM. But first, Terraform needed to be installed on their local machine. 

## 1. Run the following command to install Terraform.
```bash
sudo sh ./terraform.sh
``` 
1. Enter to Terraform directory
2. Change the configuration of the `main.tf` file according to their need and run the following commands.
3. ``` terraform init ```
4. ``` terraform plan ```
5. ``` terraform apply ```
6. To delete created instance/s, run ```terraform destroy```

# Jenkins (Optional)
If anyone wants to create CI/CD pipeline using Jenkins, they need to run this installation file to install Jenkins.
```bash
sudo sh ./jenkins.sh
``` 
