resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    name = "mainvpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    name = "mainigw"
  }
}

resource "aws_subnet" "subnet_pub" {
  count = length(var.pubsubnet)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = element(var.pubsubnet,count.index)
  availability_zone = element(var.azones,count.index)

  tags = {
    name = "subnet-public"
  }
}


resource "aws_subnet" "subnet_pri" {
  count = length(var.prisubnet)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = element(var.prisubnet,count.index)
  availability_zone = element(var.azones,count.index)

  tags = {
    name = "subnet-private"
  }
}

resource "aws_route_table" "pub" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    name = "pub"
  }
}

resource "aws_route" "pubroute" {
  route_table_id            = aws_route_table.pub.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
  depends_on                = [aws_route_table.pub]
}

resource "aws_route_table_association" "pubsubassoc" {
  count = length(var.pubsubnet)
  subnet_id      = element(aws_subnet.subnet_pub.*.id,count.index)
  route_table_id = aws_route_table.rtpub.id
}

resource "aws_eip" "eip" {
  vpc = true
  depends_on = [
    aws_internet_gateway.igw
  ]

}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = element(aws_subnet.subnet_pub.*.id,0)
  depends_on = [
    aws_internet_gateway.igw
  ]
  
}



resource "aws_route_table" "pri" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    name = "pri"
  }
}

resource "aws_route" "priroute" {
    route_table_id = aws_route_table.pri.id
    nat_gateway_id = aws_nat_gateway.nat.id
    destination_cidr_block = "0.0.0.0/0"
  
}

resource "aws_route_table_association" "prisubassoc" {
  count = length(var.prisubnet)
  subnet_id      = element(aws_subnet.subnet_pri.*.id,count.index)
  route_table_id = aws_route_table.pri.id
}

resource "aws_security_group" "default" {
  name        = "vpc-default-sg"
  description = "Default security group to allow inbound/outbound from the VPC"
  vpc_id      = aws_vpc.vpc.id
  depends_on  = [aws_vpc.vpc]
  ingress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
    
  }
  
  egress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = "true"
    
  }

}