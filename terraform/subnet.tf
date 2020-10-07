resource "aws_subnet" "subnet_publica" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnetPublica
  availability_zone       = var.availabilityZone
  map_public_ip_on_launch = var.mapPublicIP

  tags = {
    Name = "Subnet_Publica"
  }
}