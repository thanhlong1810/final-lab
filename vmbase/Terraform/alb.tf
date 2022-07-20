##################################################################
# Create ALB AWS
##################################################################

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "alb-landing-web"

  load_balancer_type = "application"

  vpc_id             = var.vpc_id
  subnets            = ["subnet-07206c7282df68bac","subnet-08ff8b104c0f8c607"]
  security_groups    = [aws_security_group.http_https.id]

##################################################################
# Create Target group AWS
##################################################################

  target_groups = [
      {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 3000
      target_type      = "instance"

      targets = {
          my_target = {
          target_id = module.ec2_final_lab.id
          port = 3000
          }
       }
      }
    ]

##################################################################
# Create Listener rules AWS
##################################################################

    http_tcp_listeners = [
        {
        port               = 80
        protocol           = "HTTP"
        target_group_index = 0
        }
    ]

    # https_listeners = [
    #     {
    #     port               = 443
    #     protocol           = "HTTPS"
    #     certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
    #     target_group_index = 0
    #     }
    # ]


    tags = {
        Environment = "ALB"
    }

  depends_on = [module.ec2_final_lab]

}

