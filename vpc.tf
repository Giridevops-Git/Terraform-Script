resource "aws_vpc" "my_testvpc" {
    cidr_block = "192.168.0.0/16"

    tags = {
      name = "test-vpc"
    }
  
}

resource "aws_subnet" "Frist-subnet" {
    vpc_id = aws_vpc.my_testvpc.id #implicit dependecy
    cidr_block = "192.168.0.0/24"
  tags = {
    "name" = "1-subnet"
  }
  
  depends_on = [
    aws_vpc.my_testvpc
  ]
}

resource "aws_subnet" "Second-subnet" {
    vpc_id = aws_vpc.my_testvpc.id #implicit dependecy
    cidr_block = "192.168.1.0/24"
  tags = {
    "name" = "2-subnet"
  }
  depends_on = [
    aws_subnet.Frist-subnet
  ]
}

resource "aws_subnet" "Thread-subnet" {
    vpc_id = aws_vpc.my_testvpc.id #implicit dependecy
    cidr_block = "192.168.2.0/24"
  tags = {
    "name" = "3-subnet"
  }
  depends_on = [
    aws_subnet.Second-subnet
  ]
}
resource "aws_subnet" "Four-subnet" {
    vpc_id = aws_vpc.my_testvpc.id #implicit dependecy
    cidr_block = "192.168.3.0/24"
  tags = {
    "name" = "4-subnet"
  }
  depends_on = [
    aws_subnet.Thread-subnet
  ]
}
resource "aws_subnet" "Five-subnet" {
    vpc_id = aws_vpc.my_testvpc.id #implicit dependecy
    cidr_block = "192.168.4.0/24"
  tags = {
    "name" = "5-subnet"
}
depends_on = [
  aws_subnet.Four-subnet
]

}
resource "aws_subnet" "six-subnet" {
    vpc_id = aws_vpc.my_testvpc.id #implicit dependecy
    cidr_block = "192.168.5.0/24"
  tags = {
    "name" = "6-subnet"
  }
  depends_on = [
    aws_subnet.Five-subnet
  ]
}
