/* 
locals variables used to add Variables in the local.
This local variable cannot paramaterized
Cannot be changed with "-var" while running terraform apply command 

workspace strings has been added we can create different env using workspace
# terraform workspace list // it will list the workspacess
# terraform workspace new <workspace-name / env-name> //it will create new workspace
# terraform workspace select <workspace-name>  // it will select / change the workspace
 */

locals {

  anyware                = "0.0.0.0/0"
  securitygroup-name-jenkins = "security-group-jenkins-${terraform.workspace}"

  ssh                    = 22
  http                   = 80
    http-8080                   = 8080

  tcp                    = "tcp"

  // lodals for ec2
  ec2-jenkins-server-name = "ec2-jenkins-server-${terraform.workspace}"
  ec2-ssh-key         = "terraform"
}