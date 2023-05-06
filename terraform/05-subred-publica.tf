resource "aws_subnet" "subred-publica" {

    vpc_id = aws_vpc.this.id
    cidr_block = local.vpc.cidr_subnet_public
    map_public_ip_on_launch = true
    availability_zone = "us-east-1a"

    tags = {
        Name = "${local.prefix}-subred-publica"
        Environment = local.env
        Path = "${basename(abspath(path.module))}/05-subred-publica.tf"
    }

    depends_on = [ 
        aws_vpc.this
     ]

}