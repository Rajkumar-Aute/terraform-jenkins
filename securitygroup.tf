// creating web security group
resource "aws_security_group" "security-group" {
  name        = local.securitygroup-name-jenkins
  description = "allow port 22, 80, 8080"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    cidr_blocks = [local.anyware]
    description = "open 22"
    from_port   = local.ssh
    protocol    = local.tcp
    to_port     = local.ssh
  }

  ingress {
    cidr_blocks = [local.anyware]
    description = "open 80"
    from_port   = local.http
    protocol    = local.tcp
    to_port     = local.http
  }


  ingress {
    cidr_blocks = [local.anyware]
    description = "open 8080"
    from_port   = local.http-8080
    protocol    = local.tcp
    to_port     = local.http-8080
  }

  egress {
    cidr_blocks = [local.anyware]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  tags = {
    "Name" = local.securitygroup-name-jenkins
    "env"  = terraform.workspace
  }
}