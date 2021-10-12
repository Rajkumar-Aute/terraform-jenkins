// information output about below resources
output "vpcid" {
  value = aws_default_vpc.default
}

output "server-id" {
  value = aws_instance.ec2-jenkins.id
}

output "server-ip" {
  value = aws_instance.ec2-jenkins.public_ip
}

output "php-url" {
  value = format("http://%s/info.php", aws_instance.ec2-jenkins.public_ip)
}
