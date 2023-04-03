module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.cidr_block

  azs             = var.azs
  private_subnets = var.subnet_cidr_private
  public_subnets  = var.subnet_cidr

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "DevOps"
  }
}
