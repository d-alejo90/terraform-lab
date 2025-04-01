output "instance_ip_addr" {
  value = { for service, i in aws_instance.terraform_lab_example_01 : service => i.private_ip }
}
