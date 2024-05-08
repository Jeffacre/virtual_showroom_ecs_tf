resource "aws_vpc" "ecs_vpc" {
  cidr_block = "10.0.0.0/16"
  tags       = local.tags
}

# resource "aws_subnet" "public_subnet1" {
#   vpc_id            = aws_vpc.ecs_vpc.id
#   cidr_block        = "10.0.1.0/24"
#   availability_zone = "${var.region}a"
#   map_public_ip_on_launch = var.map_public_ip_on_launch
#   tags = local.tags
# }

# resource "aws_subnet" "public_subnet2" {
#   vpc_id            = aws_vpc.ecs_vpc.id
#   cidr_block        = "10.0.2.0/24"
#   availability_zone = "${var.region}b"
#   map_public_ip_on_launch = var.map_public_ip_on_launch
#   tags = local.tags
# }

# resource "aws_security_group" "ecs_sg" {
#   name_prefix = "ecs_sg"
#   vpc_id      = aws_vpc.ecs_vpc.id

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = [var.your_ip_address]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

  tags = local.tags
}