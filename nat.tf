
resource "aws_eip" "nat" {
  domain = "vpc"

  depends_on = [aws_internet_gateway.main]

  tags = {
    Name = "main-nat-eip"
  }
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = module.bastion.bastion_public_subnet_id

  depends_on = [aws_internet_gateway.main]

  tags = {
    Name = "main-nat-gateway"
  }
}