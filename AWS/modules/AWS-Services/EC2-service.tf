resource "aws_instance" "create_instance_public-1a" {
  instance_type = "t2.micro"
  ami           = var.ami_id
  subnet_id     = aws_subnet.public_subnet_az1.id
  tags = {
    Name = "Public-1A"
  }
  vpc_security_group_ids = [aws_security_group.create_ec2_sg.id]
  user_data              = file("${path.module}/user-data/get_subnet-id.txt")
  depends_on             = [aws_subnet.public_subnet_az1]
}
resource "aws_instance" "create_instance_public-1b" {
  instance_type = "t2.micro"
  ami           = var.ami_id
  subnet_id     = aws_subnet.public_subnet_az2.id
  tags = {
    Name = "Public-1B"
  }
  vpc_security_group_ids = [aws_security_group.create_ec2_sg.id]
  depends_on             = [aws_subnet.public_subnet_az2]

}

resource "aws_instance" "create_instance_private-1a" {
  instance_type = "t2.micro"
  ami           = var.ami_id
  subnet_id     = aws_subnet.private_subnet_az1.id
  tags = {
    Name = "Private-1A"
  }
  vpc_security_group_ids = [aws_security_group.create_ec2_sg.id]
  depends_on             = [aws_subnet.private_subnet_az1]

}

resource "aws_instance" "create_instance_private-1b" {
  instance_type = "t2.micro"
  ami           = var.ami_id
  subnet_id     = aws_subnet.public_subnet_az2.id
  tags = {
    Name = "Private-2B"
  }
  vpc_security_group_ids = [aws_security_group.create_ec2_sg.id]
  depends_on             = [aws_subnet.private_subnet_az2]

}

resource "aws_security_group" "create_ec2_sg" {
  name        = "Allow-All"
  description = "Allow all inboud traffic for testing"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id     = aws_vpc.create_vpc.id
  depends_on = [aws_vpc.create_vpc]
}
