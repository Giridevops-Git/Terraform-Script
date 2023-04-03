resource "aws_security_group" "my_psql" {
  name        = "tf-psqlsg"
  description = "Allow web traffics"
  vpc_id      = module.vpc.vpc_id 

  ingress = [
    {
      description      = "HTTP"
      from_port        = local.http_port     
      to_port          = local.http_port 
      protocol         = local.tcp
      cidr_blocks      = [local.anywhere]  
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
      self = false
    },
  {
      description      = "psql"
      from_port        = local.pssql_port
      to_port          = local.pssql_port
      protocol         = local.tcp
      cidr_blocks      = [local.anywhere]  
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
      self = false      
  },

    {
      description      = "SSH"
      from_port        = local.ssh_port
      to_port          = local.ssh_port
      protocol         = local.tcp
      cidr_blocks      = [local.anywhere]  
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
      self = false      
    }
  ]


  egress = [
    {
      description      = "for all outgoing traffics"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
    }
  ]

  tags = {
    Name = "sg-for-module-vpc"
  }
}