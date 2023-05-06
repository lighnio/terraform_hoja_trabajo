resource "aws_subnet" "subred-privada" {

    vpc_id = aws_vpc.this.id
    cidr_block = local.vpc.cidr_subnet_public
    map_public_ip_on_launch = false
    availability_zone = "us-east-1b"

    tags = {
        Name = "${local.prefix}-subred-publica"
        Environment = local.env
        Path = "${basename(abspath(path.module))}/06-subred-privada.tf"
    }

    depends_on = [ 
        aws_vpc.this
     ]

}