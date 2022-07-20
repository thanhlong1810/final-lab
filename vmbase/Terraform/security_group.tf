##################################################################
# Create Security group
##################################################################

# Create security group in Application loadbalance

  resource "aws_security_group" "http_https" {
    name        = "secgroup_ALB"
    description = "allow http & https"
    vpc_id      = var.vpc_id

    ingress {
      description      = "Allow HTTP"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
    
    ingress {
      description      = "Allow HTTPS"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
      
    tags = {
      Name = "secgroup_ALB"
      Environment = "ALB"
    } 
  }

# Add outbound rules in security group for Application loadbalance

  resource "aws_security_group_rule" "extra_rule" {
    description              = "Allow connect port 3000 EC2"
    security_group_id        = "${aws_security_group.http_https.id}"
    from_port                = 3000
    to_port                  = 3000
    protocol                 = "tcp"
    type                     = "egress"
    source_security_group_id = "${aws_security_group.internal_web.id}"
  }

# Create security group in EC2

   resource "aws_security_group" "internal_web" {
    name        = "secgroup_EC2"
    description = "allow ssh & port web local"
    vpc_id      = var.vpc_id

    ingress {
      description      = "SSH from myip"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["113.161.54.161/32","27.74.242.52/32"]
    }

    ingress {
      description      = "Allow HTTP"
      from_port        = 3000
      to_port          = 3000
      protocol         = "tcp"
      security_groups  = [aws_security_group.http_https.id]
    }
    
    egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
      Name = "secgroup_EC2"
      Environment = "EC2"
    }
  }