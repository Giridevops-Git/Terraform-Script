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

resource "null_resource" "webprovisoner" {
  triggers = {
    running_number = var.web-trigger
  }  
    provisioner "remote-exec" { 
        connection { 
          type = "ssh" 
          user = "ubuntu"
          private_key = file("~/.ssh/id_rsa") 
          host = aws_instance.mywebinstance.public_ip

           
        }
        inline = [
          "sudo apt update",
          "sudo apt install apache2 -y",
          "sudo apt install openjdk-11-jdk -y"

        ]
      
    }
  
}