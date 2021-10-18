// creation of ec2 instances
resource "aws_instance" "ec2-jenkins" {
  ami                         = data.aws_ami.ubuntu.id
  associate_public_ip_address = true
  instance_type               = var.ec2-instance-type
  key_name                    = local.ec2-ssh-key
  vpc_security_group_ids      = [aws_security_group.security-group.id]

  tags = {
    "Name" = local.ec2-jenkins-server-name
    "env"  = terraform.workspace
  }
}

// null resource and provisioner is add to run the script at the time of creating the resources

resource "null_resource" "null-provisionining" {

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("C:/Users/raj/terraform.pem") // provide the ssh key path by creating from AWS Console
    host        = aws_instance.ec2-jenkins.public_ip
  }

  provisioner "file" {
    source      = "./jenkinsscript.sh"
    destination = "/home/ubuntu/jenkinsscript.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "cd /home/ubuntu",
      "chmod +x jenkinsscript.sh",
      "sh jenkinsscript.sh",
      "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
    ]
  }
}