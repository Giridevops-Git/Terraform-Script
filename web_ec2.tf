resource "aws_instance" "mywebinstance" { 
    ami = var.ami-id
    instance_type = "t2.micro"
    associate_public_ip_address = true 
    key_name = "mylaptopkeypair"
    vpc_security_group_ids = [aws_security_group.my_psql.id] 
    subnet_id = module.vpc.public_subnets[0]
    tags = {
      "Name" = "webec2"
      
    }
    depends_on = [
      module.vpc,
      aws_security_group.my_psql
      
      
    ]
  
}