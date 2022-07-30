resource "aws_vpc" "untitled" {
  cidr_block = "172.16.0.0/16"
  tags = {
    Name = "untitled-vpc"
  }
}

resource "aws_subnet" "untitled-1a" {
  vpc_id            = aws_vpc.untitled.id
  cidr_block        = "172.16.1.0/24"
  availability_zone = "ap-northeast-1a"
}


resource "aws_internet_gateway" "untitled-gw" {
  vpc_id = aws_vpc.untitled.id

  tags = {
    Name = "untitled"
  }
}

resource "aws_route_table" "untitled-public-table" {
  vpc_id = aws_vpc.untitled.id
}

resource "aws_route" "untitled-public-route" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = aws_route_table.untitled-public-table.id
  gateway_id             = aws_internet_gateway.untitled-gw.id
}

resource "aws_route_table_association" "untitled-1a-associate-public" {
  route_table_id = aws_route_table.untitled-public-table.id
  subnet_id      = aws_subnet.untitled-1a.id
}
