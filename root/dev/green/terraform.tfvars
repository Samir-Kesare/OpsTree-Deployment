#  Green TG Health Check AWS CLI
# aws elbv2 describe-target-health \
# --target-group-arn arn:aws:elasticloadbalancing:us-east-2:133673781875:targetgroup/dev-green-frontend-TG/123a66c2eed2af94 | grep State

# for i in `seq 1 10`; do curl -s dev-alb-240471275.us-east-2.elb.amazonaws.com | grep \<title\>React; done
# alb_arn              = "arn:aws:elasticloadbalancing:us-east-2:133673781875:listener/app/dev-alb/cab1793a4bc40ca8/d2684220d4991dc0"
# terragrunt apply -auto-approve -var="traffic_distribution=split"

# blue_tg_arn          = "arn:aws:elasticloadbalancing:us-east-2:133673781875:targetgroup/Dev-Frontend-TG/de73823d6b5e5ac3"
traffic_distribution = "blue"

#--------------------------------Launch Template ----------------------------------

private_key_algorithm = "RSA"
private_key_rsa_bits  = 4096
template_name         = "green-frontend-template"
template_description  = "green template for Dev-Frontend"
frontend_ami_name     = "frontend-app-v2"
instance_type         = "t2.micro"
instance_keypair      = "green-frontend.pem"
# subnet_ID             = "subnet-063700ed8bfb4cf49"
user_data_script_path = "./script.sh"
# security_groups_id    = ["sg-0e6cc36a0925a8c15"]

#--------------------------------- Target Group -----------------------------------#

target_group_name                = "dev-green-frontend-TG"
target_group_port                = 3000
target_group_protocol            = "HTTP"
# TG_vpc_id                        = "vpc-0bbec19a68e347b75"
health_check_path                = "/"
health_check_port                = "traffic-port"
health_check_interval            = 30
health_check_timeout             = 5
health_check_healthy_threshold   = 2
health_check_unhealthy_threshold = 2

#--------------------------Configure Auto Scaling group ---------------------------#

autoscaling_group_name = "dev-green-frontend-ASG"
ASG_version            = "$Latest" // "$Latest" change this accrd.
# subnet_ids             = ["subnet-063700ed8bfb4cf49"]
tag_key                = "Name"
tag_value              = "green-dev-frontend-ASG"
propagate_at_launch    = true
min_size               = 1
max_size               = 2
desired_capacity       = 1

#---------------------------- Auto Scaling Policies -------------------------------#

scaling_policy_name    = "target-tracking-policy"
policy_type            = "TargetTrackingScaling"
predefined_metric_type = "ASGAverageCPUUtilization"
target_value           = 50.0

#------------------------------- Listener rule of ALB -----------------------------#

# frontend_listener_arn = "arn:aws:elasticloadbalancing:us-east-2:133673781875:listener/app/dev-alb/cab1793a4bc40ca8/d2684220d4991dc0"
listener_rule_priority = 90 # this priority should be less than frontend listener rule priority
path_pattern = "*"
enable_tg_stickiness= "false"
tg_stickiness_duration= 1