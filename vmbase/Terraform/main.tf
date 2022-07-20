##################################################################
# Create EC2 AWS
##################################################################

module "ec2_final_lab" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  name = "final-lab"

  ami                         = "ami-051f0947e420652a9"
  instance_type               = "t2.micro"
  key_name                    = "longtt"
  monitoring                  = true

  vpc_security_group_ids      = [aws_security_group.internal_web.id]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  disable_api_termination     = false
  cpu_credits                 = "standard"
  
  root_block_device = [{
    volume_type               = "gp2"
    volume_size               = "16"
    delete_on_termination     = true
  }]

  tags = {
    Terraform      = "true"
    Ansible        = "true"
    Environment    = "final-lab"
  }
}



  # connection {
  #   type     = "ssh"
  #   user     = "ubuntu"
  #   private_key = file("longtt.pem")
  #   host = self.public_ip
  # }

  # provisioner "local-exec" {
  #   command = "touch success"
  # }

  # provisioner "remote-exec" {
  #   inline = ["sudo apt update", "sudo apt install python3 -y", "echo Done!"]
  # }
  
