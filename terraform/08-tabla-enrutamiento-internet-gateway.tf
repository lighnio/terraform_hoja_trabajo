resource "aws_route_table" "tabla_enrutamiento_internet_gateway" {
    vpc_id = "${aws_vpc.this.id}"

    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.this.id}"
    }

    tags = {
      using_case = "Acceso a Internet"
      Name = "${local.prefix}-tabla-enrutamiento-publica"
      Environment = local.env
      Path = "${basename(abspath(path.module))}/08-tabla-enrutamiento-internet-gateway-ig.tf"
    }

}

resource "aws_route_table_association" "tabla-enrutamiento-1" {
    subnet_id = "${aws_subnet.subred-publica.id}"
    route_table_id = "${aws_route_table.tabla_enrutamiento_internet_gateway.id}"
}