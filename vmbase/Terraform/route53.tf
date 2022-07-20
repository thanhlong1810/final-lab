# resource "aws_route53_record" "landing_web" {
#   zone_id = "Z051074124VC7QXN0Y5CV"
#   name    = "final-lab.long.tt"
#   type    = "A"
#   alias {
#     name                   = "landing"
#     zone_id                = "Z1LMS91P8CMLE5"
#     evaluate_target_health = true
#   }

# }