resource "aws_db_subnet_group" "my_dbsubs" {
    name = "mypsqlsubnets" 
    subnet_ids = [ module.vpc.private_subnets[0],module.vpc.private_subnets[1] ]
  
}
resource "aws_db_instance" "my_rdspsql" {  
    allocated_storage = 20
    db_name = "girish" 
    engine = "postgres"
    engine_version = "14.6"
    instance_class = "db.t3.micro"
    username       = "root"
    password       = "rootroot"
    skip_final_snapshot  = true 
    depends_on = [
      module.vpc,
      aws_db_subnet_group.my_dbsubs
    ]
    vpc_security_group_ids = [aws_security_group.my_psql.id]
    db_subnet_group_name = aws_db_subnet_group.my_dbsubs.name


  
}
