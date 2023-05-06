resource "aws_route_table" "nat_gateway_privada" {
    vpc_id = "${aws_vpc.this.id}"

    route {
        cidr_block = "0.0.0.0/24"
        nat_gateway_id = aws_nat_gateway.nat.id
    }

    tags = {
      using_case = "natgateway"
      Name = "${local.prefix}-tabla-enrutamiento-privada"
      Environment = local.env
      Path = "${basename(abspath(path.module))}09-tabla-enrutamiento-nat-gateway.tf"
    }
}

resource "aws_route_table_association" "rt1" {

    subnet_id = aws_subnet.subred-privada.id
    route_table_id = aws_route_table.nat_gateway_privada.id
  
}